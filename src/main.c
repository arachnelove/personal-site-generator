#include <stdio.h>
#include <dirent.h>
#include <sys/stat.h>

int main(int argc, char *argv[]){
    
    DIR *siteDir;
    struct dirent *member;
    struct stat fileInfo;

    //check arguments
    if(argc != 2){
        perror("Please provide (only) a site directory name\n");
        return(1);
    }

    //open directory
    siteDir = opendir(argv[1]);

    if(siteDir==NULL){
        perror("Error opening directory");
        return(2);
    }

    while(member=readdir(siteDir)){
        stat(member->d_name,&fileInfo);
        if(S_ISDIR(fileInfo.st_mode)){
            printf("path:%s", member->d_name);
        }
        printf(" dir?:%d\n", S_ISDIR(fileInfo.st_mode));
    }

    closedir(siteDir);
}
