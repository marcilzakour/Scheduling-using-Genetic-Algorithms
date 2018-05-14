function  [state,options,optchanged] = plotTable(options,state,flag)
global tableAxes;
global noStudents;
global studentSetsNames;
 t = uitable();
 colorgen = @(color,text) ['<html><table border=1 width=400 bgcolor=',color,'><TR><TH></TH><TH >',text,'</TH><TH></TH></TR><TR ><TD  width = 100>Instructor</TD><TD  width = 100>Course</TD><TD  width = 100>Class</TD></TR> </table></html>'];

 [~,idx] = min(state.Score);
 chromosome = state.Population(idx,:);
 n = length(chromosome);
 for i = 1 : noStudents
     cols{i} = colorgen('#00FFFF',studentSetsNames{i});
%      cols{3*(i-1)+1} = sprintf('Instructor for %s',studentSetsNames{i});
%      cols{3*(i-1)+2} = sprintf('Course for %s',studentSetsNames{i});
%      cols{3*(i-1)+3} = sprintf('Class for %s',studentSetsNames{i});
 end;
 set(t,'BackgroundColor',[1 1 1;.8 .8 .8]);
 set(t,'columnName',cols);
 set(t,'data',chromosomeToTableData(chromosome));
 set(t,'Position',[0,0,1500,350]);

   set(t,'ColumnWidth',{400});