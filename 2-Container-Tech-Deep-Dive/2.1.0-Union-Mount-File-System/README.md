# Union Mount FileSystem

---

               ** Please Note: This might not work on VM

Step 1: Create Three Folders named `Folder-1`,  `Folder-2` and `mnt`

![](img/ufs-1.png)


Step 2: Create sub-directories and files in `Folder-1` and `Folder-2`

![](img/ufs-2.png)

        
Step 3: Check the structure of directories that have been created

![](img/ufs-3.png)

        
Step 4: Run `unionfs-fuse -o dirs=Folder-1:Folder-2  mnt/` . The directories and files in `Folder-1` and `Folder-2` will be mounted on `mnt`

![](img/ufs-4.png)
        

Step 5: Check the structure of `mnt/` 

![](img/ufs-5.png)

        
Step 6: To unmount, run `umount -l /path/to/mnt`

![](img/ufs-6.png)

