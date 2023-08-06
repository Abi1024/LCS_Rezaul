#include <sys/types.h>
#include <sys/stat.h>
#include <sys/mman.h> /* mmap() is defined in this header */
#include <fcntl.h>
#include <unistd.h>
#include <stdio.h>
#include <cstring>
#include <cstdlib>
#include <string>
#include <iostream>
const unsigned long long num = 20000000;

void print_mem_data(){
	//printf("Start of function\n");
	int pid = getpid();
	char res[200];
	sprintf(res,"/proc/%d/statm",pid);
	printf("%s\n",res);
	FILE* fp = fopen(res,"r");
	if (fp == NULL){
		printf("Null\n");
		return;
	}
	char c;
	c = fgetc(fp);
	while (c != EOF){
		printf("%c", c);
		c = fgetc(fp);
	}
	fclose(fp);
	//printf("End of function\n");
}


//concatenates string s with itself n times
std::string repeat(std::string s, int n)
{
  std::string s1 = s;
  for (int i=1; i<n;i++)
    s += s1;
  return s;
}

void err_quit(const char *msg)
{
  printf("%s",msg);
  exit(1);
}

int main (int argc, char *argv[])
{
  int fdout;
  char *dst;
  int mode = 0x0777;

  if (argc != 1)
  err_quit (("usage: a.out nullbytes"));

  if ((fdout = open ("nullbytes", O_RDWR, mode )) < 0){
    printf ("can't create %s for writing\n", argv[1]);
    return 0;
  }

  std::string test = repeat("Hello World!\n",1000);
  const int length = strlen(test.c_str());
  printf("length of string: %d\n", length);
  /*
  if ((dst = (char*)mmap (0,  length*num+num, PROT_READ | PROT_WRITE, MAP_SHARED, fdout, 0)) == (char*)-1){
      printf ("mmap error for output");
      return 0;
  }*/
   std::cout << "Num: " << num << std::endl;
   std::cout << "Length: " << length << std::endl;
   std::cout << "Total size: " << length*num << std::endl;
  /* if ((dst = (char*)mmap (0,  length*num+num, PROT_READ | PROT_WRITE, MAP_PRIVATE | MAP_ANONYMOUS, -1, 0)) == (char*)MAP_FAILED){
      printf ("mmap error for output with code");
      return 0;
  }*/
  
  if ((dst = (char*)mmap (0,  length*num+num, PROT_READ | PROT_WRITE, MAP_SHARED , fdout, 0)) == (char*)MAP_FAILED){
       printf ("mmap error for output with code");
       return 0;
}
  print_mem_data();
  for (unsigned long long i = 0; i < num ; i++){
    //std::cout << "i: " << i << std::endl;
    if (i % 10000 == 0){
      std::cout << "i: " << i << std::endl;
      print_mem_data();
    }
    //printf("Writing\n");
    memcpy(dst+i*length,test.c_str(),length);
    //printf("Reading\n"); 
	for (int j = 0; j < length; j++){
	char k = *(dst + i*length+j);
	}
  }
  return 0;
}
/* main */
