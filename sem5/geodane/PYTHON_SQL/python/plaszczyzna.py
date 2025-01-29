import numpy as np
import math



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
       

#macierz D - dane [X - north, Y - east, Z ]

Dane=np.array([[1,100,100,120], [2,200,100,125], [3,200,200,125], [4,100,200,120], [5,150,150,122.51]])
cp=calc_plane(Dane)

print ("Niewiadome: ",cp.vx)
katy=cp.calc_ang()
alfa=katy[0]*(200/math.pi)
beta=katy[1]*(200/math.pi)
gamma=(katy[2])*(200/math.pi)
print ("Katy: ",alfa," ",beta," ",gamma)
fiaz= cp.calc_slope()
print ("Azymut: ",fiaz[0]*(200/math.pi),"Nachylenie: ",fiaz[1])
#print(cp.calc_V())

Dane=np.array([[1,10,10,125], [2,20,10,120], [3,20,20,120], [4,10,20,130], [5,15,15,122.5]])
cp=calc_plane(Dane)

print ("Niewiadome: ",cp.vx)
katy=cp.calc_ang()
alfa=katy[0]*(200/math.pi)
beta=katy[1]*(200/math.pi)
gamma=(katy[2])*(200/math.pi)
print ("Katy: ",alfa," ",beta," ",gamma)
fiaz= cp.calc_slope()
print ("Azymut: ",fiaz[0]*(200/math.pi),"Nachylenie: ",fiaz[1])

Dane=np.array([[1,10,10,120], [2,20,10,125], [3,20,20,130], [4,10,20,125], [5,15,15,125]])
cp=calc_plane(Dane)

print ("Niewiadome: ",cp.vx)
katy=cp.calc_ang()
alfa=katy[0]*(200/math.pi)
beta=katy[1]*(200/math.pi)
gamma=(katy[2])*(200/math.pi)
print ("Katy: ",alfa," ",beta," ",gamma)
fiaz= cp.calc_slope()
print ("Azymut: ",fiaz[0]*(200/math.pi),"Nachylenie: ",fiaz[1])


Dane=np.array([[1,10,10,130], [2,20,10,125], [3,20,20,120], [4,10,20,125], [5,15,15,125]])
cp=calc_plane(Dane)

print ("Niewiadome: ",cp.vx)
katy=cp.calc_ang()
alfa=katy[0]*(200/math.pi)
beta=katy[1]*(200/math.pi)
gamma=(katy[2])*(200/math.pi)
print ("Katy: ",alfa," ",beta," ",gamma)
fiaz= cp.calc_slope()
print ("Azymut: ",fiaz[0]*(200/math.pi),"Nachylenie: ",fiaz[1])


Dane=np.array([[1,10,10,120], [2,20,10,120], [3,20,20,125], [4,10,20,125], [5,15,15,122.5]])
cp=calc_plane(Dane)

print ("Niewiadome: ",cp.vx)
katy=cp.calc_ang()
alfa=katy[0]*(200/math.pi)
beta=katy[1]*(200/math.pi)
gamma=(katy[2])*(200/math.pi)
print ("Katy: ",alfa," ",beta," ",gamma)
fiaz= cp.calc_slope()
print ("Azymut: ",fiaz[0]*(200/math.pi),"Nachylenie: ",fiaz[1])


Dane=np.array([[1,10,10,125], [2,20,10,125], [3,20,20,120], [4,10,20,120], [5,15,15,122.5]])
cp=calc_plane(Dane)

print ("Niewiadome: ",cp.vx)
katy=cp.calc_ang()
alfa=katy[0]*(200/math.pi)
beta=katy[1]*(200/math.pi)
gamma=(katy[2])*(200/math.pi)
print ("Katy: ",alfa," ",beta," ",gamma)
fiaz= cp.calc_slope()
print ("Azymut: ",fiaz[0]*(200/math.pi),"Nachylenie: ",fiaz[1])
print (cp.calc_V())

Dane=np.array([[0, 366760.0, 368384.0, 118.97], [0, 366761.0, 368384.0, 119.17], [0, 366762.0, 368384.0, 118.98], [0, 366763.0, 368384.0, 118.99], [0, 366764.0, 368384.0, 119.02]])
cp=calc_plane(Dane)
print ("Niewiadome: ",cp.vx)
katy=cp.calc_ang()
alfa=katy[0]*(200/math.pi)
beta=katy[1]*(200/math.pi)
gamma=(katy[2])*(200/math.pi)
print ("Katy: ",alfa," ",beta," ",gamma)
fiaz= cp.calc_slope()
print ("Azymut: ",fiaz[0]*(200/math.pi),"Nachylenie: ",fiaz[1])
print (cp.calc_V())
print ("----------------------------")

Dane=np.array( [[0.00000e+00, 3.66724e+05, 3.68383e+05, 1.18840e+02], [0.00000e+00, 3.66725e+05, 3.68383e+05, 1.18830e+02], [0.00000e+00, 3.66724e+05, 3.68382e+05, 1.18830e+02], [0.00000e+00, 3.66725e+05, 3.68382e+05, 1.18840e+02]])
cp=calc_plane(Dane)
print ("Niewiadome: ",cp.vx)
katy=cp.calc_ang()
alfa=katy[0]*(200/math.pi)
beta=katy[1]*(200/math.pi)
gamma=(katy[2])*(200/math.pi)
print ("Katy: ",alfa," ",beta," ",gamma)
fiaz= cp.calc_slope()
print ("Azymut: ",fiaz[0]*(200/math.pi),"Nachylenie: ",fiaz[1])
print (cp.calc_V())
