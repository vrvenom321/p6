#include<stdio.h>
#include<stdlib.h>


struct node
{
int page;
struct node *left;
struct node *right;
};


typedef struct node *NODEPTR;
NODEPTR list=NULL;


NODEPTR createlist(NODEPTR list,int page);
NODEPTR moveforward(NODEPTR list, int cp ,int steps);
NODEPTR movebackward(NODEPTR list, int cp, int steps);
void display();
NODEPTR getnode();

NODEPTR createlist(NODEPTR list, int page)
{
	NODEPTR p,q;
	p=getnode();
	p->page=page;
	p->left=NULL;
	p->right=NULL;
	if(list==NULL)
		list=p;
	else{
		for(q=list; q->right!=NULL; q=q->right)
		;
		q->right=p;
		p->left=q;

	}
	return(list);
}

	
NODEPTR moveforward(NODEPTR list, int cp,int steps)
{
	NODEPTR p,q;
 	int count=0,s;
	if(list==NULL)
		printf("\n Empty list");
	else{
		p=list;
                for(p=list,count=0;count<cp-1; count++)
                  p=p->right;
             
                for(q=p,s=0;s<steps;s++)
                 {
                    if(q->right==NULL)
		    	return(q);
		    q=q->right;
 		   }
                 return(q);
}
}

NODEPTR movebackward(NODEPTR list, int cp,int steps)
{
	NODEPTR p,q;
 	int count=0,s;
	if(list==NULL)
		printf("\n Empty list");
	else{
		p=list;
                for(p=list,count=0;count<cp-1; count++)
                  p=p->right;
             
                for(q=p,s=0;s<steps;s++)
                 {
                    if(q->left==NULL)
		            	return(q);
		           q=q->left;
 		   }
                 return(q);
    }
}


void display(NODEPTR list)
{
	NODEPTR p;
	p=list;
	if(p==NULL)
		printf("\nEmpty list");
	else
	{
		printf("\n The page list contains: ");
		for(p=list;p!=NULL;p=p->right) 
		{
			printf("%d<->",p->page);
		}
	}
}

NODEPTR getnode()
{
	NODEPTR r;
	r=(NODEPTR)malloc(sizeof(struct node));
	if(r==NULL)
	{
		printf("\n Node allocation failed");
		exit(0);
	}
	return(r);
}


void main()
{
		int page,choice,steps,cp;
 		char cont;
		NODEPTR p;
		do{
		printf("\n ...........MENU...........");
		printf("\n 1->CREATE LIST\t  2->MOVE FORWARD\t  3->MOVE BACKWARD\t 4->DISPLAY 5->EXIT");
		printf("\n Enter your choice");
		scanf("%d",&choice);
		switch(choice)
		{
		case 1:printf("\n CREATION OF DOUBLY LINKED LIST OF PAGES IS IN PROGRESS:\n");
			do{
              	        	  printf("Enter a page number:");
                        	  scanf("%d",&page);
              	 	 	  list = createlist(list,page);
              	 		  printf("Do you want to enter another page[Y/N]:");
               	 		  scanf(" %c",&cont);
              		 }while(cont=='Y' || cont=='y');
               		  display(list); 
			  break;
		 	
		case 2: printf("\n MOVE FORWARD:\n");
			printf("\nEnter the current page:");
                        scanf("%d",&cp);
			printf("Enter the number of steps to move forward");
			scanf("%d",&steps);
			p=moveforward(list,cp,steps);
			printf("\n Moved forward to  page %d from %dth page",p->page, cp);
			break;
		case 3: printf("\n MOVE BACKWARD:\n");
			printf("\nEnter the current page:");
                        scanf("%d",&cp);
			printf("Enter the number of steps to move backward");
			scanf("%d",&steps);
			p=movebackward(list,cp,steps);
			printf("\n Moved backwards to  page %d from %dth page",p->page, cp);
			break;
		case 4: display(list);
		        break;
		case 5:printf("\n Quitting operation List.....\n");
			break;
		default:printf("\n Invalid choice");
			break;
		}		
	}while(choice!=5);
}
