# Analysing Docker layers with Dlayer

---


Step 1: Run `docker images` to get list of images on the machine
        
        Screenshot here
        
        
Step 2: Select an image to be analysed and run `docker save <image>:<tag> | ./dlayer -n 100 | less` 

        Screenshot here
        

