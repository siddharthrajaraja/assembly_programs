def check_if_empty(buck_arr,size_of_bucket):
    if len(buck_arr)==size_of_bucket:
        return "full"
    return "empty"

if __name__=="__main__":
    size_of_bucket=int(input("ENTER SIZE OF BUCKET: "))
    output_rate=1  # consider only one packet goes out of bucket at a time

     
    
    buck_arr=[]
    i=0    
    while True:
        input_rate=int(input("GET INPUT RATE : "))
        cpi=input_rate
        
        while cpi!=0:
                
            data=int(input("ENTER DATA TO INSERT: "))
            if check_if_empty(buck_arr,size_of_bucket)=="full":
                print(data , " is discarded")
            else:
                buck_arr.append(data)
                
            cpi=cpi-1
            print(buck_arr)
        val=buck_arr.pop(0)
        print("Popped Data is ",val)
        print(buck_arr)
        
"""
ENTER SIZE OF BUCKET: 10
GET INPUT RATE : 3
ENTER DATA TO INSERT: 10
[10]
ENTER DATA TO INSERT: 20
[10, 20]
ENTER DATA TO INSERT: 30
[10, 20, 30]
Popped Data is  10
[20, 30]
GET INPUT RATE : 4
ENTER DATA TO INSERT: 40
[20, 30, 40]
ENTER DATA TO INSERT: 50
[20, 30, 40, 50]
ENTER DATA TO INSERT: 60
[20, 30, 40, 50, 60]
ENTER DATA TO INSERT: 70
[20, 30, 40, 50, 60, 70]
Popped Data is  20
[30, 40, 50, 60, 70]
GET INPUT RATE : 4
ENTER DATA TO INSERT: 80
[30, 40, 50, 60, 70, 80]
ENTER DATA TO INSERT: 90
[30, 40, 50, 60, 70, 80, 90]
ENTER DATA TO INSERT: 100
[30, 40, 50, 60, 70, 80, 90, 100]
ENTER DATA TO INSERT: 110
[30, 40, 50, 60, 70, 80, 90, 100, 110]
Popped Data is  30
[40, 50, 60, 70, 80, 90, 100, 110]
GET INPUT RATE : 5
ENTER DATA TO INSERT: 120
[40, 50, 60, 70, 80, 90, 100, 110, 120]
ENTER DATA TO INSERT: 130
[40, 50, 60, 70, 80, 90, 100, 110, 120, 130]
ENTER DATA TO INSERT: 140
140  is discarded
[40, 50, 60, 70, 80, 90, 100, 110, 120, 130]
ENTER DATA TO INSERT: 150
150  is discarded
[40, 50, 60, 70, 80, 90, 100, 110, 120, 130]
ENTER DATA TO INSERT: 160
160  is discarded
[40, 50, 60, 70, 80, 90, 100, 110, 120, 130]
Popped Data is  40
[50, 60, 70, 80, 90, 100, 110, 120, 130]
GET INPUT RATE : 


"""
        
