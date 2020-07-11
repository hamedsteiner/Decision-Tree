
function  output = make_forest(tree, datas,atts,depth,column,class , num_of_atts )
class;
depth;
column;
current_class=class;


trues=sum(datas(:,num_of_atts+1)==current_class);
falses=sum(datas(:,num_of_atts+1)~=current_class);

%if(depth>8)
%   output=tree;
 %   return 
%end


if(class==17)
    if(depth>8)
        output=tree;
        return 
    end

end


if(trues==0)
    tree{depth}{column}=-100;
    output=tree;
    return
end

if(falses==0)
    tree{depth}{column}=100;
    output=tree;
    return
end    
    clear att_entropy;
    att_entropy=zeros(1,size(atts,2));
    depth;
    column;
    
    for j=1:size(atts,2)% test all attributes
        for k=1:16 %max(datas(:,j))+1  %separate members of each attribute 
            att_members_index{j}{k}=find(datas(:,atts(j) )==k-1);
             % now we analys the separated members for entropy
            att_members_separated{j}{k}=datas(att_members_index{j}{k},:);% i for tree#,j ro att , k for number
            % calculate entropy for each separated members of att  
            
            separated_att_classes(1)=sum(att_members_separated {j}{k}(:,num_of_atts+1)==current_class);% for each member of att
            separated_att_classes(2)=sum(att_members_separated{j}{k}(:,num_of_atts+1)~=current_class);% for each member of att    

            att_member_entropy{j}{k}=0;
            
            for kelas=1:2
                if(separated_att_classes(kelas) ~= 0 )  
                    att_member_entropy{j}{k}=att_member_entropy{j}{k}-( (separated_att_classes(kelas)/size(att_members_separated  {j}{k},1))   *log2( (separated_att_classes(kelas)/size(att_members_separated   {j}{k},1)) ) ); 
                end
            end
            %now we have entropy for each separete member of an attribuite
                
        end %we have calculated entropy for each attribuite
        
        for m=1:size( att_member_entropy{j},2)                
            att_entropy(j)= att_entropy(j)+ att_member_entropy{j}{m}*( size(att_members_separated   {j}{m},1)/ size(datas,1) ); 
        end
    end

    %clear att_members_index;
    %clear att_member_entropy;
    
    [~,max_in_current_atts]=min(att_entropy);
    max_IG_index=atts(max_in_current_atts);
    
    tree{depth}{column}=max_IG_index;
    
    
    
    if(max_in_current_atts==1)
        new_atts=atts(2:(length(atts)));
    elseif(max_in_current_atts==length(atts))
        new_atts=atts(1:(length(atts)-1));
    else
        new_atts=atts([1:(max_in_current_atts-1),(max_in_current_atts+1):(length(atts))]);
    end
    
    if( size(new_atts,2)<1)
        output=tree;
        return;
    end
    
    for att_values=1:16
        tree=make_forest(tree,att_members_separated {max_in_current_atts}{att_values},new_atts,depth+1,num_of_atts*(column-1)+att_values,class,num_of_atts );
    end
    output=tree;
    return

    

end

