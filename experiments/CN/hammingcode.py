
def frame_solution(data,redundant):
    hamcode=['$']
    data=list(data)
    data.reverse()
    j=0
    for i in range(1,len(data)+len(redundant)+1):
        if i in redundant:
            hamcode.append('@')
    
        else:
            hamcode.append(int(data[j]))
            j=j+1        
    #print(hamcode)

    return hamcode
            
                
    
    

def get_redundant_bits(data):
    arr=[]
    m=len(data)
    
    
    i=0
    while pow(2,i)-i<len(data)+1:
        i=i+1

    for i in range(0,i):
        arr.append(pow(2,i))
    return arr
    

def get_set_of_bits(n,e):
    arr=[]
    for i in range(n+1,e+1):
        if i&n!=0:
            arr.append(i)
    return arr

def parity(get_set,hamcode):
    one=0
    #print('get_Set hamcode',get_set,hamcode)
    for i in range(0,len(get_set)):
        if hamcode[get_set[i]]==1:
            one=one+1
    if one%2==0:
        return 0
    return 1

        

if __name__=="__main__":
    print("This is Code for Hamming Code GEneration: ")
    
    data=input("Enter data bits  : ")

    red_arr=get_redundant_bits(data)

    #print(red_arr)

    hamcode=frame_solution(data,red_arr)
    
    sets=[]
    
    i=0
    while i<len(red_arr):
        ans=get_set_of_bits(red_arr[i],len(data)+len(red_arr))
        sets.append(ans)
        i=i+1
    #print(sets)
    
    for i in range(0,len(hamcode)):
        if hamcode[i]=='@':
            ind_of_par_in_red_arr=red_arr.index(i)
            get_set=sets[ind_of_par_in_red_arr]

            hamcode[i]=parity(get_set,hamcode)
    hamcode=hamcode[1:]
    hamcode.reverse()
    print('Final Code generated is : ',hamcode)

"""
Test Case 1 : 
This is Code for Hamming Code GEneration: 
Enter data bits  : 1001101
Final Code generated is :  [1, 0, 0, 1, 1, 1, 0, 0, 1, 0, 1]

Test Case 2 :
This is Code for Hamming Code GEneration: 
Enter data bits  : 1010
Final Code generated is :  [1, 0, 1, 0, 0, 1, 0]
"""
    
