# Union Mount FileSystem

---

               ** Please Note: This might not work on VM

Step 1: Create Three Folders named `Folder-1`,  `Folder-2` and `mnt`

        ScreenShot Here

Step 2: Create sub-directories and files in `Folder-1` and `Folder-2`

        ScreenShot Here
        
Step 3: Check the structure of directories that have been created

        ScreenShot Here
        
Step 4: Run `unionfs-fuse -o dirs=Folder1:Folder2  mnt/` 

        ScreenShot Here
        
Step 5: Directories and files in `Folder-1` and `Folder-2` will be mounted on `mnt`

Step 6: Check the structure of `mnt/` 

        ScreenShot Here
        
Step 7: To unmount, run `umount -l /path/to/mnt`

