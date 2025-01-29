import numpy as np
import math
import sys
import re
from pathlib import Path

import psycopg2




#------------------------------------------------------
class calc_plane:
    D=np.array([])
    #X=np.array([])
    #Y=np.array([])
    #Z=np.array([])
    A=np.array([])
    L=np.array([])
    V=np.array([])
    Q=np.array([])
    QA=np.array([])
    vx=np.array([])
    nx=0
    ny=0
    
    
    def __init__(self,Dane):
        self.D=Dane
        #self.X=Dane[:,1]
        #self.Y=Dane[:,2]
        #self.Z=Dane[:,3]
        self.nx=len(self.D)
        self.ny=len(self.D[0])
        self.A=np.zeros((self.nx,self.ny-1))
        self.L=np.zeros((self.nx))
                
        for i in range(len(self.D)):
            self.A[i,0]=-(self.D[i,1])
            self.A[i,1]=-(self.D[i,2])
            self.A[i,2]=-1
            self.L[i]=-(self.D[i,3])
        #print(self.A)
        #print(self.L)
        try:
            self.Q=np.linalg.inv(np.dot(self.A.T,self.A))#(A'*A)^-1
        except:
            print('Zastosowano pseudoinversje')
            self.Q=np.linalg.pinv(np.dot(self.A.T,self.A))#(A'*A)^-1
        #print(self.Q)
        self.QA=np.dot((self.Q),self.A.T)#Q*A'
        self.vx=-(np.dot(self.QA,self.L))#-Q*A'*L
    
    def calc_V(self):
        Ax=np.array([])
        V=np.array([])
        Ax=np.dot(self.A,self.vx)
        V=Ax+self.L
        return V
    
    def calc_ang(self):
        m=self.vx[0]
        n=self.vx[1]
        mod=math.sqrt(math.pow(m,2)+math.pow(n,2)+1)
        cosalfa=m/mod
        cosbeta=n/mod
        cosgamma=1/mod
        alfa=math.acos(cosalfa)
        beta=math.acos(cosbeta)
        gamma=math.acos(cosgamma)
        ang=[alfa,beta,gamma]
        return ang
    
    def calc_slope(self):
        ang=self.calc_ang()
        
        if (self.vx[0]==0 and self.vx[1]==0):
            Az=0
        elif (self.vx[0]>0 and self.vx[1]==0):
            Az=0
        elif (self.vx[0]==0 and self.vx[1]>0):
            Az=(math.pi/2)
        elif (self.vx[0]<0 and self.vx[1]==0):
            Az=(math.pi)
        elif (self.vx[0]==0 and self.vx[1]<0):
            Az=(3/2*math.pi)
        else:
            fiAz=math.fabs(math.atan(math.cos(ang[1])/math.cos(ang[0])))
        
        if (self.vx[0]>0 and self.vx[1]>0):
            Az=fiAz
        elif (self.vx[0]<0 and self.vx[1]>0):
            Az=math.pi-fiAz
        elif (self.vx[0]<0 and self.vx[1]<0):
            Az=math.pi+fiAz
        elif (self.vx[0]>0 and self.vx[1]<0):
            Az=(2*math.pi)-fiAz
        sl=-math.tan(ang[2]) 
        slope=[Az,sl]
        return slope
#-------------------------------------------------------
tabnmt='nmt1m'
tabgrd='grd50'
tgrd_nmt='grdnmt50'

#------------------polaczenie z baza
conn = psycopg2.connect(host='192.168.2.106', port='5432', dbname='WROC', user='postgres', password='postgres')

cursor = conn.cursor()
cursor1 = conn.cursor()
cursor2 = conn.cursor()
cursor3 = conn.cursor()
#-------------dodanie kolumn
#SQL="ALTER TABLE "+tabgrd+" ADD COLUMN IF NOT EXISTS z_mean decimal(10,3); ALTER TABLE "+tabgrd+" ADD COLUMN IF NOT EXISTS std_z decimal(10,3); ALTER TABLE "+tabgrd+" ADD COLUMN IF NOT EXISTS slope decimal(10,6); ALTER TABLE "+tabgrd+" ADD COLUMN IF NOT EXISTS azimuth decimal(10,6);"
SQL="CREATE TABLE IF NOT EXISTS "+tgrd_nmt\
+ "(ind bigserial,\
geom geometry(POLYGONZ,2177),\
z_mean decimal(10,3),\
std_z decimal(10,3),\
slope decimal(10,6),\
azimuth decimal(10,6));"

cursor.execute(SQL)
conn.commit()

print("Polaczono z baza")
print("Obliczenia...")
#---------------------------------------

SQL1="SELECT * from "+ str(tabgrd)
#print (SQL1)
cursor1.execute(SQL1)
ODP1=cursor1.fetchall()
for row in ODP1:
   idn=row[0]
   geom=row[1]
   SQL2="SELECT ST_X(a.geom), ST_Y(a.geom),ST_Z(a.geom) FROM "+str(tabnmt)+" a where ST_Intersects(ST_Transform(ST_Force2D('"+geom+"'::geometry),2180),a.geom)"
   #print(SQL2)
   cursor2.execute(SQL2)
   ODP2=cursor2.fetchall()
   Z=np.array([])
   N=np.array([])
   E=np.array([])
   lp=np.array([])
   DZNE=np.array([])
   licz=0
   for rownmt in ODP2:
       Z=np.append(Z,[float(rownmt[2])])
       N=np.append(N,[float(rownmt[1])])
       E=np.append(E,[float(rownmt[0])])
       licz=licz+1
       lp=np.append(lp,licz)
   #print lp
   #print N
   #print E
   DZNE=np.vstack((lp,N))
   DZNE=np.vstack((DZNE,E))
   DZNE=np.vstack((DZNE,Z))
   #print DZNE.T
   if (len(DZNE[0])>3):
       cp=calc_plane(DZNE.T)
       fiaz= cp.calc_slope()
       azimuth=fiaz[0]*(200/math.pi)
       slope=fiaz[1]
   else:
       azimuth=9999
       slope=9999
   #print ("Azymut: ",fiaz[0]*(200/math.pi),"Nachylenie: ",fiaz[1])  
   #print Z
   zsum=np.sum(Z)
   nz=np.size(Z)
   if nz>1:
       RZ=range(0,nz-1)
       z_mean=zsum/nz
       vsumq=0
       for i in RZ:
           v=Z[i]-z_mean
           vsumq=vsumq+pow(v,2)
       std_z=np.sqrt(vsumq/(nz-1))
   else:
       z_mean=9999
       std_z=9999
   #print("srednia z obl :"+str(z_mean))
   #zmean=np.mean(Z)
   #print("srednia z funk :"+str(zmean))
   #print("odchylenie stand. "+str(std_z))
   SQL3="INSERT INTO "+tgrd_nmt+"(ind,geom,z_mean,std_z,slope,azimuth) VALUES ("+str(idn)+",'"+geom+"'::geometry,"+str(z_mean)+","+str(std_z)+","\
+str(slope)+","+str(azimuth)+");"

   #print(SQL3)
   cursor3.execute(SQL3)
   conn.commit()   


print("Obliczono")
#---------------zamkniecie polaczen
cursor.close()
cursor1.close()
cursor2.close()
cursor3.close()
conn.close()

