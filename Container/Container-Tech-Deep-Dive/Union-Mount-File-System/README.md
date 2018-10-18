# Union Mount FileSystem

---

## Please Note: This might not work on VM


#### Step 1: Create Three Folders named `Folder-1`,  `Folder-2` and `mnt`

    mkdir Folder-1 Folder-2 mnt

![](img/ufs-1.png)


#### Step 2: Create sub-directories and files in `Folder-1` and `Folder-2`

    mkdir -p Folder-1/Dir1 Folder-2/Dir1 Folder-2/Dir2
    
    touch Folder-1/File1.txt Folder-1/Dir1/dir1.txt Folder-1/Dir1/one.txt
    
    touch Folder-2/Dir1/file2.txt Folder-2/Dir1/two.txt Folder-2/Dir2/dir2_file.txt Folder-2/File2.txt

![](img/ufs-2.png)

        
#### Step 3: Check the structure of directories that have been created

    tree .

![](img/ufs-3.png)

        
#### Step 4: Run `unionfs-fuse -o dirs=Folder-1:Folder-2  mnt/` . The directories and files in `Folder-1` and `Folder-2` will be mounted on `mnt`

    unionfs-fuse -o dirs=Folder-1:Folder-2  mnt/

![](img/ufs-4.png)
        

#### Step 5: Check the structure of `mnt/` 

    tree mnt

![](img/ufs-5.png)

        
#### Step 6: To unmount, run `umount -l mnt`

    umount -l mnt

![](img/ufs-6.png)

