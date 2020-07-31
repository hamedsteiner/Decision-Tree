clc
clear
load ( 'letter_recognition.mat');

shuffle=randperm(16000);
datas=[train_data(shuffle,:),train_labels(shuffle,:)];
classes=datas(:,17);

tree={};
atts=[1:16];
tiri={};
dorost=zeros(1,26);
s=zeros(1,26);

TP=zeros(1,26);
FN=zeros(1,26);
FP=zeros(1,26);
TN=zeros(1,26);
    
 
takhmin=cell(1,26);


%tic;

for classs=1:26
    
    tiri=make_tree(tree, datas,atts,1,1,classs );
    tiri;
    %%2nd way
        %if(classs~=26)
        %    for i=1:size(index)
        %    dd(i,:)=datas(index(i),:);
        %    end
        %    datas=dd;
        %    clear dd
       % end    

%toc

for i=1:4000
        edame=true;
        dep=1;
        col=1;
        while(edame==true) 
            if(  size(tiri)<dep)
                break
            end
            if(  size(tiri{dep})<col)
                break
            end 
            value=tiri{dep}{col};
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
 





    %for i=1:4000
    %    takhmin{i};
    %a(i)= (takhmin{i});  %cell2mat
    %end
    %if ( a(i)==1)
    %s(classs)=sum(a);
    %end
    
    
  %sum(test_labels(:)==class)
  %s(class)  
  %predic_accuracy(class)=100- abs( 100*( sum(test_labels(:)==class)-s(class))/s(class)  )


%clear takhmin;



%for i=1:26
 %  takhminn(i,:)=cell2mat(takhmin{i});
%end





(dorost)

(sum(dorost)/4000)*100
        
      
        
confusionn_matrix(1,1)=sum(TP);
confusionn_matrix(1,2)=sum(FN);
confusionn_matrix(2,1)=sum(FP);
confusionn_matrix(2,2)=sum(TN);
        
        
        
 confusionn_matrix=confusionn_matrix/26;       
        
        
        
        
        
        
        
        
    
    
