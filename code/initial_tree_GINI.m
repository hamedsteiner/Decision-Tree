clc
clear
load ( 'letter_recognition.mat');

shuffle=randperm(16000);
datas=[train_data(shuffle,:),train_labels(shuffle,:)];
classes=datas(:,17);

classs=1;
tree=[];
%decisions={};
attributes=[1:16];
tiri=[];

TP=zeros(1,26);
FN=zeros(1,26);
FP=zeros(1,26);
TN=zeros(1,26);

%datas=datas(1:500,:)
dorost=zeros(1,26);
s=zeros(1,26);
%index=zeros(1,26);


    
 
for classs=1:26
    tree=[];
    %classs
    tiri=[];
    tiri=make_tree_GINI(tree, datas,attributes,1,1,classs );
    
    
    
    depths=zeros(1,size(tiri,2)/3);
    columns=zeros(1,size(tiri,2)/3);
    atts=zeros(1,size(tiri,2)/3);
    
    for i=1:3:size(tiri,2)
        depths(floor(i/3)+1)=tiri(i);
    end
    for i=2:3:size(tiri,2)
        columns(floor(i/3)+1)=tiri(i);
    end
    for i=3:3:size(tiri,2)
        atts(floor(i/3))=tiri(i);
    end
    
    
for i=1:4000
        edame=true;
        dep=1;
        col=1;
        
        
        while(edame==true) 
         
            if(size(col,2)==0)
                break;
            end
            
            index=min(abs(find(depths==dep & columns==col)));
            if (size(index)<1)
                break;
            end
            
            %if(  size(tiri)<dep)
            %    break
           % end
           % if(  size(tiri{dep})<col)
            %    break
           % end 
            value=atts(index);
            if(value==100)
                takhmin{classs}{i}=1; 
                edame=false;
                break;
            elseif(value==-100)
                takhmin{classs}{i}=0;
                edame=false;
                break;
            elseif(edame~=false)
            dep=dep+1;
            col=16*(col-1)+test_data(i,value)+1;
            end
        end
        if(value==-100)
            if(test_labels(i)~=classs)
                TN(classs)=TN(classs)+1;
            else
                FP(classs)=FP(classs)+1;
            end
        elseif(value==100)
            if(test_labels(i)==classs)
                dorost(classs)=dorost(classs)+1;
                TP(classs)=TP(classs)+1;
            else
                FN(classs)=FN(classs)+1;
            end
        end 
        
        
        
        
end
%for classs=1:26
    

end


confusionn_matrix(1,1)=sum(TP);
confusionn_matrix(1,2)=sum(FN);
confusionn_matrix(2,1)=sum(FP);
confusionn_matrix(2,2)=sum(TN);
        
        
        
 confusionn_matrix=confusionn_matrix/26
