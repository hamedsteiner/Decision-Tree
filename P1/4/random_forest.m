clc
clear
load ( 'letter_recognition.mat');

shuffle=randperm(16000);
datas=[train_data(shuffle,:),train_labels(shuffle,:)];
%saved_datas=datas;
classes=datas(:,17);

tree={};

tiri={};
dorost2=zeros(1,26);
s=zeros(1,26);

K_index=[1,2,3];
K=[2,4,8];


%% halate tabdil b 2 derakht


decision2=zeros(1,1);
    %atts=[1:(16/2)];
    atts=[1:(16)];
    clear subdata;
    datas=[train_data(shuffle,:),train_labels(shuffle,:)];
    
   % for i=1:2
     %   subdata{i}=datas(:,(16/2)*(i-1)+1:i*(16/2));  % datas for our subtrees
   % end    

    
   
    for i=1:2
        subdata{i}=datas(1+(i-1)*8000:i*8000,:);  % datas for our subtrees
    end 
    
    for classs=1:26 % for each class we use 2 subtrees
         for subtiri=1:2  % num of attributes we have to put togehter in a tree
             clear tiri;
             
             datas=[train_data(shuffle,:),train_labels(shuffle,:)];
             datas=subdata{subtiri};
             %datas=[datas,train_labels(shuffle,:)];   
             tiri=make_forest(tree, datas,atts,1,1,classs,(16) ); 

            for i=1:4000
                    edame=true;
                    dep=1;
                    col=1;
                    while(edame==true) 
                       % if(  size(tiri)<dep)
                        %    break
                       % end
                       % tiri{dep};
                       % if(  size(tiri{dep})<col)
                       %     break
                       % end 
                        value=tiri{dep}{col};
                        if(value==100)
                            edame=false;
                            break;
                        elseif(value==-100)
                            edame=false;
                            break;
                        elseif(edame~=false)
                        dep=dep+1;
                        col=(16/2)*(col-1)+test_data(i,value)+1;
                        end
                    end
                    
                    if(value==-100)
                        subtree{classs}{subtiri}(i)=-1;
                        
                    elseif(value==100)
                        subtree{classs}{subtiri}(i)=1;
                    end 
            end   
         end
  
    end
    
    
    for classs=1:26
        for datas=1:4000
            trues=0;
            falses=0;
            for tiri=1:2
                if (subtree{classs}{tiri}(datas)==1) % majority vote
                    trues=trues+1;
                else
                    falses=falses+1;
                end
            end
            if(trues>=falses)
                decision2(classs,datas)=1;
            else
                decision2(classs,datas)=-1; 
            end
        end
    end

 dorost2=0;
for i=1:4000
    indices=find(decision2(:,i)==1);
    for j=1:size(indices,2)
      if(test_labels(i)==j)
      dorost2=dorost2+1;
      break;
      end

    end
end
    

(dorost2)

(sum(dorost2)/4000)*100;















