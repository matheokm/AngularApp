USE Test
                GO


                DROP table #TablaTemporal
                DROP table #TablaInfo
            

                CREATE TABLE #TablaTemporal (fila varchar(MAX))



                DECLARE @tabla VARCHAR(50);
                DECLARE  @sqlCommand VARCHAR(MAX);
                set @tabla  = 'Genero'



                                                               
                                                  CREATE TABLE #TablaInfo (esquema varchar(100),campo varchar(100), posicion varchar(100), tipo varchar(100) ,longitud varchar(100))
                                                  INSERT INTO #TablaInfo

                                                               SELECT TABLE_SCHEMA as esquema,COLUMN_NAME as campo,ORDINAL_POSITION as posicion,DATA_TYPE as tipo,CHARACTER_MAXIMUM_LENGTH as longitud
                                                               FROM INFORMATION_SCHEMA.COLUMNS
                                                               WHERE TABLE_NAME = @tabla

                SET @sqlCommand =  ' *****************  Entidad  **************' ;
                SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                exec (@sqlCommand)
                
                SET @sqlCommand =  'public class ' +   @tabla   ;
                SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                exec (@sqlCommand)

                SET @sqlCommand =  '{' ;
                SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                exec (@sqlCommand)

                Declare @ic int = 0

                Declare @filac int = 0

                Declare @campoc varchar (100)
                Declare @tipoc varchar (100)

                                                               set @filac = (Select count(*) as filast from #TablaInfo)

                                                                 while @ic <   @filac
                                                                 begin
                                                                                              set @campoc = (select campo from #TablaInfo
                                                                                                                                                                                order by posicion asc offset @ic rows
                                                                                                                                                                                fetch next 1 row only)
                                                                                                                                                                               

                               set @tipoc = (
                               select 
                                CASE
                                                               WHEN tipo = 'varchar' THEN 'string'
                                                               WHEN tipo = 'datetime' THEN 'DateTime'   
                                                                                                                                                                                                                                               WHEN tipo = 'int' THEN 'imt'  
                                                               ELSE 'no'
                                                END as tipo from #TablaInfo
                               order by posicion asc offset @ic rows
                               fetch next 1 row only)
                                                                                                                 
                               SET @sqlCommand =   '       public ' + @tipoc + ' ' + @campoc + ' { get; set; }'  + char(13)+CHAR(10) ;
                     SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                     exec (@sqlCommand)
                                                 set @ic = @ic +  1;
                                                 end

                SET @sqlCommand =  '}' ;
                SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                exec (@sqlCommand)



                                                   SET @sqlCommand =  ' *****************  Logica de Datos  **************' ;
                SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                exec (@sqlCommand)

                SET @sqlCommand =  replace(@tabla,'gesTb','')+  'Datos'   + char(13)+CHAR(10) ;
                SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                exec (@sqlCommand)


                                                               SET @sqlCommand =  'public static List<'+ @tabla + '> Consulta' + replace(@tabla,'gesTb','') + '()';
                SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                exec (@sqlCommand)

                SET @sqlCommand =   '{'   ;
                SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                exec (@sqlCommand)

                SET @sqlCommand =  '   try'    + char(13)+CHAR(10) ;
                SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                exec (@sqlCommand)

                SET @sqlCommand =  '        {'    + char(13)+CHAR(10) ;
                SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                exec (@sqlCommand)

                SET @sqlCommand =   '             using (IDbConnection db = new SqlConnection(connectionString))'    + char(13)+CHAR(10) ;
                SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                exec (@sqlCommand)

                SET @sqlCommand =   '             {'    + char(13)+CHAR(10) ;
                SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                exec (@sqlCommand)

                                                               SET @sqlCommand =   '                   var result = db.Query<'+ @tabla +'>("[flj].[Pa_'+ @tabla + '_Selecciona]",'    + char(13)+CHAR(10) ;
                SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                exec (@sqlCommand)

             
                SET @sqlCommand =   '                   commandType: CommandType.StoredProcedure).ToList();'  + char(13)+CHAR(10) ;
                SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                exec (@sqlCommand)

                SET @sqlCommand =  '                    return result;'  + char(13)+CHAR(10) ; 
                SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                exec (@sqlCommand)


                SET @sqlCommand =  '             }'  + char(13)+CHAR(10) ;
                SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                exec (@sqlCommand)

                SET @sqlCommand =  '        }'  + char(13)+CHAR(10) ;
                SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                exec (@sqlCommand)

                SET @sqlCommand =  '   catch (Exception ex)'  + char(13)+CHAR(10) ;
                SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                exec (@sqlCommand)

                SET @sqlCommand =  '       {'  + char(13)+CHAR(10) ;
                SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                exec (@sqlCommand)

                SET @sqlCommand =  '        System.Diagnostics.EventLog.WriteEntry("Solverix", $"Flujos - ' +  @tabla + ' ==> ERROR: {ex.Message} - STACKTRACE: {ex.StackTrace} - INNEREXCEPTION: {ex.InnerException}", System.Diagnostics.EventLogEntryType.Error);
'  + char(13)+CHAR(10) ;
                SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                exec (@sqlCommand)

                SET @sqlCommand =  '       throw;'  + char(13)+CHAR(10) ;
                SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                exec (@sqlCommand)

                SET @sqlCommand =  '       }'  + char(13)+CHAR(10) ;
                SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                exec (@sqlCommand)


                SET @sqlCommand =  ' }'  + char(13)+CHAR(10) ;
                SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                exec (@sqlCommand)




                SET @sqlCommand =  'public int ' +  'Actualiza' +  replace(@tabla,'gesTb','') + '(string accion, ' + @tabla + ' ' + @tabla + ') '   ;
                SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                exec (@sqlCommand)

                SET @sqlCommand =   '{'   ;
                SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                exec (@sqlCommand)

                SET @sqlCommand =  '   try'    + char(13)+CHAR(10) ;
                SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                exec (@sqlCommand)

                SET @sqlCommand =  '        {'    + char(13)+CHAR(10) ;
                SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                exec (@sqlCommand)

                SET @sqlCommand =   '             using (IDbConnection db = new SqlConnection(connectionString))'    + char(13)+CHAR(10) ;
                SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                exec (@sqlCommand)

                SET @sqlCommand =   '             {'    + char(13)+CHAR(10) ;
                SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                exec (@sqlCommand)

                SET @sqlCommand =   '               var parameters = new DynamicParameters();'    + char(13)+CHAR(10) ;
                SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                exec (@sqlCommand)




                                                               Declare @ip int = 0

                                                               Declare @filap int = 0

                                                               Declare @campop varchar (100)
                                                               set @filap = (Select count(*) as filas from #TablaInfo)

                                                               while @ip <   @filap
                                                               begin
                                                                               set @campop = (select campo from #TablaInfo
                                                                                                                                                                             order by posicion asc offset @ip rows
                                                                                                                                                                             fetch next 1 row only)

                                                                                                                                                                             SET @sqlCommand =   '               parameters.Add("@' + @campop + '", ' + @tabla + '.'+ @campop +');'  + char(13)+CHAR(10) ;
                                                                                                                                              SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                                                                                                                                              exec (@sqlCommand)
                                                               set @ip = @ip +  1;
                                                               end
                
                                                               SET @sqlCommand =   '               parameters.Add("@accion", accion);'  + char(13)+CHAR(10) ;
                SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                exec (@sqlCommand)
                SET @sqlCommand =   '               db.Query<' + @tabla + '>("GetServiceVolumeProfileReport", parameters,'  + char(13)+CHAR(10) ;
                SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                exec (@sqlCommand)

                SET @sqlCommand =  '               commandType: CommandType.StoredProcedure).ToList();'  + char(13)+CHAR(10) ; 
                SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                exec (@sqlCommand)

                SET @sqlCommand =  '               return 1;'  + char(13)+CHAR(10) ;
                SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                exec (@sqlCommand)

                SET @sqlCommand =  '             }'  + char(13)+CHAR(10) ;
                SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                exec (@sqlCommand)

                SET @sqlCommand =  '        }'  + char(13)+CHAR(10) ;
                SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                exec (@sqlCommand)

                SET @sqlCommand =  '   catch (Exception ex)'  + char(13)+CHAR(10) ;
                SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                exec (@sqlCommand)

                SET @sqlCommand =  '       {'  + char(13)+CHAR(10) ;
                SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                exec (@sqlCommand)

                SET @sqlCommand =  '        System.Diagnostics.EventLog.WriteEntry("Solverix", $"Flujos - ' +  @tabla + ' ==> ERROR: {ex.Message} - STACKTRACE: {ex.StackTrace} - INNEREXCEPTION: {ex.InnerException}", System.Diagnostics.EventLogEntryType.Error);
'  + char(13)+CHAR(10) ;
                SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                exec (@sqlCommand)

                SET @sqlCommand =  '       throw;'  + char(13)+CHAR(10) ;
                SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                exec (@sqlCommand)

                SET @sqlCommand =  '       }'  + char(13)+CHAR(10) ;
                SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                exec (@sqlCommand)


                SET @sqlCommand =  ' }'  + char(13)+CHAR(10) ;
                SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                exec (@sqlCommand)

                SET @sqlCommand =  ' *****************  Logica de Negocio  **************' ;
                SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                exec (@sqlCommand)



                                                               
                
                SET @sqlCommand =  'public List<' + @tabla + '> Consulta' + replace(@tabla,'gesTb','') + '()'   ;
                SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                exec (@sqlCommand)

                SET @sqlCommand =   '{'   ;
                SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                exec (@sqlCommand)

                SET @sqlCommand =  '   try'    + char(13)+CHAR(10) ;
                SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                exec (@sqlCommand)

                SET @sqlCommand =  '        {'    + char(13)+CHAR(10) ;
                SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                exec (@sqlCommand)

                SET @sqlCommand =  '              var result =  ' + replace(@tabla,'gesTb','') + 'Datos.Consulta' + replace(@tabla,'gesTb','') +'();'  + char(13)+CHAR(10) ;
                SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                exec (@sqlCommand)

                                                               SET @sqlCommand =  '              return  result;'  ;
                SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                exec (@sqlCommand)

                SET @sqlCommand =  '        }'  + char(13)+CHAR(10) ;
                SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                exec (@sqlCommand)

                SET @sqlCommand =  '   catch (Exception ex)'  + char(13)+CHAR(10) ;
                SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                exec (@sqlCommand)

                SET @sqlCommand =  '        {'  + char(13)+CHAR(10) ;
                SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                exec (@sqlCommand)

                SET @sqlCommand =  '        System.Diagnostics.EventLog.WriteEntry("Solverix", $"Flujos - ' +  @tabla + ' ==> ERROR: {ex.Message} - STACKTRACE: {ex.StackTrace} - INNEREXCEPTION: {ex.InnerException}", System.Diagnostics.EventLogEntryType.Error);
'  + char(13)+CHAR(10) ;
                SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                exec (@sqlCommand)

                SET @sqlCommand =  '        throw;'  + char(13)+CHAR(10) ;
                SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                exec (@sqlCommand)

                SET @sqlCommand =  '        }'  + char(13)+CHAR(10) ;
                SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                exec (@sqlCommand)


                SET @sqlCommand =  ' }'  + char(13)+CHAR(10) ;
                SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                exec (@sqlCommand)


                
                SET @sqlCommand =  'public int ' +  'Actualiza' + replace(@tabla,'gesTb','') + '(string accion,' + @tabla + ' ' + @tabla + ') '   ;
                SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                exec (@sqlCommand)

                                                               SET @sqlCommand =   '{'   ;
                SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                exec (@sqlCommand)

                                                               SET @sqlCommand =  '   try'    + char(13)+CHAR(10) ;
                SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                exec (@sqlCommand)

                SET @sqlCommand =  '        {'    + char(13)+CHAR(10) ;
                SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                exec (@sqlCommand)

                SET @sqlCommand =  '              return new ' + replace(@tabla,'gesTb','') + 'Datos().Actualiza' + replace(@tabla,'gesTb','') +'(accion,' + @tabla + ');'  + char(13)+CHAR(10) ;
                SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                exec (@sqlCommand)

                                                               SET @sqlCommand =  '        }'  + char(13)+CHAR(10) ;
                SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                exec (@sqlCommand)

                SET @sqlCommand =  '   catch (Exception ex)'  + char(13)+CHAR(10) ;
                SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                exec (@sqlCommand)

                SET @sqlCommand =  '        {'  + char(13)+CHAR(10) ;
                SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                exec (@sqlCommand)

                SET @sqlCommand =  '        System.Diagnostics.EventLog.WriteEntry("Solverix", $"Flujos - ' +  @tabla + ' ==> ERROR: {ex.Message} - STACKTRACE: {ex.StackTrace} - INNEREXCEPTION: {ex.InnerException}", System.Diagnostics.EventLogEntryType.Error);
'  + char(13)+CHAR(10) ;
                SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                exec (@sqlCommand)

                SET @sqlCommand =  '        throw;'  + char(13)+CHAR(10) ;
                SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                exec (@sqlCommand)

                SET @sqlCommand =  '        }'  + char(13)+CHAR(10) ;
                SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                exec (@sqlCommand)


                SET @sqlCommand =  ' }'  + char(13)+CHAR(10) ;
                SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                exec (@sqlCommand)




                SET @sqlCommand =  ' *****************  Controller  **************' ;
                SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                exec (@sqlCommand)


                                                               SET @sqlCommand =  '[HttpGet]' ;
                SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                exec (@sqlCommand)

                SET @sqlCommand =  'public OperationResult<List<'+ @tabla + '>> Consulta' +  replace(@tabla,'gesTb','') + '()'   ;
                SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                exec (@sqlCommand)

                SET @sqlCommand =   '{'   ;
                SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                exec (@sqlCommand)

                                                               SET @sqlCommand =   '    try'   ;
                SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                exec (@sqlCommand)

                                                               SET @sqlCommand =   '    {'   ;
                SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                exec (@sqlCommand)


                SET @sqlCommand =   '        var result = new ' +  replace(@tabla,'gesTb','') + 'Negocio().Consulta' + replace(@tabla,'gesTb','') + '();' + char(13)+CHAR(10) ;
                SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                exec (@sqlCommand)

                SET @sqlCommand =   '        if (result.Count() > 0)'  + char(13)+CHAR(10) ;
                SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                exec (@sqlCommand)

                SET @sqlCommand =   '          return OperationResult<List<'+ @tabla + '>>.CreateSuccessResult(result);'  + char(13)+CHAR(10) ;
                SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                exec (@sqlCommand)
                
                SET @sqlCommand =   '        else'  + char(13)+CHAR(10) ;
                SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                exec (@sqlCommand) 
            
               SET @sqlCommand =   '          return OperationResult<List<'+ @tabla + '>>.CreateFailure();'  + char(13)+CHAR(10) ;
                SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                exec (@sqlCommand)

                SET @sqlCommand =  '     }'  + char(13)+CHAR(10) ;
                SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                exec (@sqlCommand) 

                SET @sqlCommand =  '    catch (System.Exception ex)'  + char(13)+CHAR(10) ;
                SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                exec (@sqlCommand) 

                                                               SET @sqlCommand =  '    {'  + char(13)+CHAR(10) ;
                SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                exec (@sqlCommand) 

                                                               SET @sqlCommand =  '    return OperationResult<List<'+ @tabla + '>>.CreateFailure(ex);'  + char(13)+CHAR(10) ;
                                                               SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                exec (@sqlCommand) 

                                                               SET @sqlCommand =  '    }'  + char(13)+CHAR(10) ;
                SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                exec (@sqlCommand) 


                                                               SET @sqlCommand =  '}'  + char(13)+CHAR(10) ;
                SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                exec (@sqlCommand) 


                                                               
                SET @sqlCommand =  '[HttpPost]' ;
                SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                exec (@sqlCommand)

                SET @sqlCommand =  'public OperationResult<int> ' +  'Actualiza' +  replace(@tabla,'gesTb','') + '(string accion,' + @tabla + ' ' + @tabla + ') '   ;
                SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                exec (@sqlCommand)

                SET @sqlCommand =   '{'   ;
                SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                exec (@sqlCommand)

                                                               SET @sqlCommand =   '    try'   ;
                SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                exec (@sqlCommand)

                                                               SET @sqlCommand =   '    {'   ;
                SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                exec (@sqlCommand)

                SET @sqlCommand =   '      var result = new ' +  replace(@tabla,'gesTb','') + 'Negocio().Actualiza' + replace(@tabla,'gesTb','') + '(accion ,'  + @tabla + ');'  + char(13)+CHAR(10) ;
                SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                exec (@sqlCommand)

                SET @sqlCommand =   '      if (result == 1)'  + char(13)+CHAR(10) ;
                SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                exec (@sqlCommand)

                SET @sqlCommand =  '        return OperationResult<int>.CreateSuccessResult(result);'  + char(13)+CHAR(10) ;
                SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                exec (@sqlCommand)

                SET @sqlCommand =  '      else'  + char(13)+CHAR(10) ;
                SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                exec (@sqlCommand) 

           
                SET @sqlCommand =  '        return OperationResult<int>.CreateFailure();'  + char(13)+CHAR(10) ;
                SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                exec (@sqlCommand) 


                                                               SET @sqlCommand =  '     }'  + char(13)+CHAR(10) ;
                SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                exec (@sqlCommand) 

                SET @sqlCommand =  '    catch (System.Exception ex)'  + char(13)+CHAR(10) ;
                SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                exec (@sqlCommand) 

                                                               SET @sqlCommand =  '    {'  + char(13)+CHAR(10) ;
                SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                exec (@sqlCommand) 

                                                               SET @sqlCommand =  '    return OperationResult<int>.CreateFailure(ex);'  + char(13)+CHAR(10) ;
                                                               SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                exec (@sqlCommand) 

                                                               SET @sqlCommand =  '     }'  + char(13)+CHAR(10) ;
                SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                exec (@sqlCommand) 

                SET @sqlCommand =  '}'  + char(13)+CHAR(10) ;
                SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                exec (@sqlCommand) 





    --        SET @sqlCommand =  ' ******************************* PROCEDIMIENTO ALMACENADO *********************************'  + char(13)+CHAR(10) ;
    --        SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
    --        exec (@sqlCommand) 

    --        SET @sqlCommand =  'CREATE PROCEDURE [flj].[Pa_' + @tabla + '_Actualiza]'  + char(13)+CHAR(10) ;
    --        SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
    --        exec (@sqlCommand) 
                  

    --            Declare @insert varchar (MAX)
    --            Declare @insertValues varchar (MAX)
    --            Declare @isp int = 0

    --            Declare @filasp int = 0

    --            Declare @camposp nvarchar (100)

    --            Declare @tiposp nvarchar (100)

    --            Declare @longitudsp nvarchar (100)

    --            set @insert = ''
    --            set @insertValues = ''
    --            set @filasp = (Select count(*) as filas from #TablaInfo)

    --            while @isp <   @filasp
    --            begin
    --                            set @camposp = (select campo from #TablaInfo
    --                            order by posicion asc offset @isp rows
    --                            fetch next 1 row only)

    --                            set @tiposp = (
                                                               --                                                                           select tipo from #TablaInfo
                                                               --                                                                           order by posicion asc offset @isp rows
                                                               --                                                                                           fetch next 1 row only)

    --                            set @longitudsp = (
                                                               --                                                                           select isnull(longitud,'NULL') from #TablaInfo
                                                               --                                                                           order by posicion asc offset @isp rows
                                                               --                                                                           fetch next 1 row only)

    --            IF @isp = 0 
    --            BEGIN
    --                            IF @tiposp = 'varchar'
    --                            SET @sqlCommand =   '@' + @camposp + ' ' + @tiposp  + '(' + @longitudsp + ')=''''''''' + char(13)+CHAR(10) ;
    --                            IF @tiposp = 'datetime'
    --                            SET @sqlCommand =   '@' + @camposp + ' ' + @tiposp  + '=null' + char(13)+CHAR(10) ;
    --            END
    --            ELSE
   --            BEGIN
    --                            IF @tiposp = 'varchar'
    --                            SET @sqlCommand =   ',@' + @camposp + ' ' + @tiposp  + '(' + @longitudsp + ')=''''''''' + char(13)+CHAR(10) ;
    --                            IF @tiposp = 'datetime'
    --                            SET @sqlCommand =   '@' + @camposp + ' ' + @tiposp  + '=null' + char(13)+CHAR(10) ;
    --            END
    --            SET @sqlCommand = 'Insert into #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
    --            exec (@sqlCommand)

    --            IF @isp = 0 set @insert = @insert  + @camposp
    --            IF @isp > 0 set @insert = @insert  + ',' + @camposp;

    --            IF @isp = 0 set @insertValues = @insertValues  + '@' + @camposp;
    --            IF @isp > 0 set @insertValues = @insertValues  + ',' + '@' + @camposp

    --            set @isp = @isp +  1;
    --            end



    --            SET @sqlCommand =  ',@accion varchar(100)='''''''''  + char(13)+CHAR(10) ;
    --            SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
    --            exec (@sqlCommand) 

    --            SET @sqlCommand =  'AS'  + char(13)+CHAR(10) ;
    --            SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
    --            exec (@sqlCommand) 

                                                               --SET @sqlCommand =  'IF @activo = ''''NO''''  SET @fechaDesactivacion = GETDATE();'  + char(13)+CHAR(10) ;
    --            SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
    --            exec (@sqlCommand) 

    --            SET @sqlCommand =  'IF @accion = ''''insertar'''''  + char(13)+CHAR(10) ;
    --            SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
    --            exec (@sqlCommand) 

    --            SET @sqlCommand =  'BEGIN'  + char(13)+CHAR(10) ;
    --            SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
    --            exec (@sqlCommand) 

    --            SET @sqlCommand =  '  INSERT INTO ' + @tabla + ' (' + @insert + ')' + char(13)+CHAR(10) ;
    --            SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
    --            exec (@sqlCommand) 

    --            SET @sqlCommand =  '  Values(' + @insertValues + ')' + char(13)+CHAR(10) ;
    --            SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
    --            exec (@sqlCommand) 

    --            SET @sqlCommand =  'END'  + char(13)+CHAR(10) ;
    --            SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
    --            exec (@sqlCommand) 

                                                               -- SET @sqlCommand =  'IF @accion = ''''actualizar'''''  + char(13)+CHAR(10) ;
    --            SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
    --            exec (@sqlCommand) 

    --            SET @sqlCommand =  'BEGIN'  + char(13)+CHAR(10) ;
    --            SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
    --            exec (@sqlCommand) 

    --            SET @sqlCommand =  '  UPDATE [SLXFLUJO].[flj].[' + @tabla + ']' + char(13)+CHAR(10) ;
    --            SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
    --            exec (@sqlCommand) 

    --            SET @sqlCommand =  '   SET ' + char(13)+CHAR(10) ;
    --            SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
    --            exec (@sqlCommand) 

    --            SET @sqlCommand =  'END'  + char(13)+CHAR(10) ;
    --            SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
    --            exec (@sqlCommand) 


                              SET @sqlCommand =  ' *****************  MODELO ANGULAR  **************' ;
                SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                exec (@sqlCommand)

                                                               
                                                               SET @sqlCommand =  ' Nombtre: ' +   @tabla +  '.ts';
                SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                exec (@sqlCommand)
                
                SET @sqlCommand =  'export class ' +   @tabla + '{'  ;
                SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                exec (@sqlCommand)


                SET @ic  = 0

                SET @filac  = 0

                SET @campoc =''
                SET @tipoc =''

                                                               set @filac = (Select count(*) as filast from #TablaInfo)

                                                                 while @ic <   @filac
                                                                begin
                                                                                              set @campoc = (select campo from #TablaInfo
                                                                                                                                                                                order by posicion asc offset @ic rows
                                                                                                                                                                                fetch next 1 row only)
                                                                                                                                                                               

                               set @tipoc = (
                               select 
                                CASE
                                                               WHEN tipo = 'varchar' THEN 'string'
                                                               WHEN tipo = 'datetime' THEN 'DateTime'     
                                                                                                                                                                                                                                               WHEN tipo = 'int' THEN 'number'  
                                                               ELSE 'no'
                                                END as tipo from #TablaInfo
                               order by posicion asc offset @ic rows
                               fetch next 1 row only)
                                                                                                                 
                               SET @sqlCommand =   '       ' + @campoc + ':'+ @tipoc + char(13)+CHAR(10) ;
                     SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                     exec (@sqlCommand)
                                                 set @ic = @ic +  1;
                                                 end

                SET @sqlCommand =  '}' ;
                SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                exec (@sqlCommand)


                                                               SET @sqlCommand =  ' *****************  SERVICIO ANGULAR **************' ;
                SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                exec (@sqlCommand)

                                                               
                                                               SET @sqlCommand =  ' Nombtre: ' +    replace(@tabla,'gesTb','') +  'service.ts';
                SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                exec (@sqlCommand)
                
                SET @sqlCommand =  'public ' +  'Consulta' + replace(@tabla,'gesTb','') + '(): Observable<any> {'   ;
                SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                exec (@sqlCommand)

                SET @sqlCommand =  '    let sessionString = localStorage.getItem("datos")'   ;
                SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                exec (@sqlCommand)

                SET @sqlCommand =  '    let obj = <Context>JSON.parse(sessionString)'    + char(13)+CHAR(10) ;
                SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                exec (@sqlCommand)

                SET @sqlCommand =  '    let headers = new HttpHeaders();'    + char(13)+CHAR(10) ;
                SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                exec (@sqlCommand)

                                                               SET @sqlCommand =  '    headers = headers.set(''''Content-Type'''', ''''application/json'''');'    + char(13)+CHAR(10) ;
                SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                exec (@sqlCommand)

                                                               SET @sqlCommand =  '    headers = headers.set(''''Authorization'''', "Bearer " + obj.Token);'    + char(13)+CHAR(10) ;
                SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                exec (@sqlCommand)

                                                               SET @sqlCommand =  '   return this.http.get(Configuration.servidor + "/Flj'  + replace(@tabla,'gesTb','') + '/Consulta' +  + replace(@tabla,'gesTb','') + '", { headers: headers });' + char(13)+CHAR(10) ;
                SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                exec (@sqlCommand)



                SET @sqlCommand =  '}'  + char(13)+CHAR(10) ;
                SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                exec (@sqlCommand)



                                                               SET @sqlCommand =  'public ' +  'Actualiza' + replace(@tabla,'gesTb','') + '(' + replace(@tabla,'gesTb','') + ':' + @tabla + 'accion:string) {'  ;
                SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                exec (@sqlCommand)

                SET @sqlCommand =  '    let sessionString = localStorage.getItem("datos")'   ;
                SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                exec (@sqlCommand)

                SET @sqlCommand =  '    let obj = <Context>JSON.parse(sessionString)'    + char(13)+CHAR(10) ;
                SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                exec (@sqlCommand)

                SET @sqlCommand =  '    let headers = new HttpHeaders();'    + char(13)+CHAR(10) ;
                SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                exec (@sqlCommand)

                                                               SET @sqlCommand =  '    headers = headers.set(''''Content-Type'''', ''''application/json'''');'    + char(13)+CHAR(10) ;
                SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                exec (@sqlCommand)

                                                               SET @sqlCommand =  '    headers = headers.set(''''Authorization'''', "Bearer " + obj.Token);'    + char(13)+CHAR(10) ;
                SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                exec (@sqlCommand)

                                                               SET @sqlCommand =  '    const params = new HttpParams()'    + char(13)+CHAR(10) ;
                SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                exec (@sqlCommand)

                                                               
                                                               SET @sqlCommand =  '    //' +  replace(@tabla,'gesTb','') +  '.usuarioCreacion = ''''dgualpa'''';'    + char(13)+CHAR(10) ;
                SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                exec (@sqlCommand)


                                                               SET @sqlCommand =  '   const data = ''''accion='''' + accion;'    + char(13)+CHAR(10) ;
                SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                exec (@sqlCommand)

                                                               SET @sqlCommand =  '   return this.http.post(Configuration.servidor + "/Flj'  + replace(@tabla,'gesTb','') + '/Actualiza' +   replace(@tabla,'gesTb','') + '?" + data,' + replace(@tabla,'gesTb','') + ',{ headers: headers, params:params });' + char(13)+CHAR(10) ;
                SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                exec (@sqlCommand)



                SET @sqlCommand =  '}'  + char(13)+CHAR(10) ;
                SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                exec (@sqlCommand)



                                                               
                                                               SET @sqlCommand =  ' *****************  COMPONENTE ANGULAR **************' ;
                SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                exec (@sqlCommand)

                               
                SET @sqlCommand =  'public ' +  'Consulta' + replace(@tabla,'gesTb','') + '() {'   ;
                SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                exec (@sqlCommand)

                                                               SET @sqlCommand =  '    this.' + LOWER(replace(@tabla,'gesTb',''))   +  '.Consulta' + replace(@tabla,'gesTb','') + '() {'   ;
                SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                exec (@sqlCommand)


                SET @sqlCommand =  '    .subscribe(res => {'   ;
                SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                exec (@sqlCommand)

                SET @sqlCommand =  '      if(res.Success == true)'    + char(13)+CHAR(10) ;
                SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                exec (@sqlCommand)

                SET @sqlCommand =  '      {'    + char(13)+CHAR(10) ;
                SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                exec (@sqlCommand)

                                                               SET @sqlCommand =  '       this.dsTb' + replace(@tabla,'gesTb','') + '.data = res.Data as ' + @tabla + '[];'   + char(13)+CHAR(10) ;
                SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                exec (@sqlCommand)

                                                               SET @sqlCommand =  '      }'    + char(13)+CHAR(10) ;
                SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                exec (@sqlCommand)

                                                               SET @sqlCommand =  '      else'    + char(13)+CHAR(10) ;
                SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                exec (@sqlCommand)

                                                               SET @sqlCommand =  '      {'    + char(13)+CHAR(10) ;
                SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                exec (@sqlCommand)

                                                   SET @sqlCommand =  '       this.dsTb' + replace(@tabla,'gesTb','') + '.data = [];'   + char(13)+CHAR(10) ;
                SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                exec (@sqlCommand)

                                                               SET @sqlCommand =  '      }'    + char(13)+CHAR(10) ;
                SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                exec (@sqlCommand)

                                                               SET @sqlCommand =  '    })'    + char(13)+CHAR(10) ;
                SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                exec (@sqlCommand)



                SET @sqlCommand =  '}'  + char(13)+CHAR(10) ;
                SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                exec (@sqlCommand)


				
                                                               SET @sqlCommand =  ' ******************************* PROCEDIMIENTO ALMACENADO *********************************'  + char(13)+CHAR(10) ;
                                                               SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                                                               exec (@sqlCommand) 

                                                               SET @sqlCommand =  'CREATE PROCEDURE [flj].[Pa_' + @tabla + '_Actualiza]'  + char(13)+CHAR(10) ;
                                                               SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                                                               exec (@sqlCommand) 
                  

                                                               Declare @insert varchar (MAX)
                                                               Declare @insertValues varchar (MAX)
                                                               Declare @isp int = 0

                                                               Declare @filasp int = 0

                                                               Declare @camposp nvarchar (100)

                                                               Declare @tiposp nvarchar (100)

                                                               Declare @longitudsp nvarchar (100)

                                                               set @insert = ''
                                                               set @insertValues = ''
                                                               set @filasp = (Select count(*) as filas from #TablaInfo)

                                                               while @isp <   @filasp
                                                               begin
                                                                               set @camposp = (select campo from #TablaInfo
                                                                                                                                                                             order by posicion asc offset @isp rows
                                                                                                                                                                             fetch next 1 row only)

                                                                               set @tiposp = (
                                                                               select tipo from #TablaInfo
                                                                                                                                                                             order by posicion asc offset @isp rows
                                                                                                                                                                             fetch next 1 row only)
                                                                               set @longitudsp = (
                                                                               select isnull(longitud,'NULL') from #TablaInfo
                                                                                                                                                                             order by posicion asc offset @isp rows
                                                                                                                                                                             fetch next 1 row only)

                                                               IF @isp = 0 
                                                               BEGIN
                                                                               IF @tiposp = 'varchar'
                                                                               SET @sqlCommand =   '@' + @camposp + ' ' + @tiposp  + '(' + @longitudsp + ')=''''''''' + char(13)+CHAR(10) ;
                                                                               IF @tiposp = 'datetime'
                                                                               SET @sqlCommand =   '@' + @camposp + ' ' + @tiposp  + '=null' + char(13)+CHAR(10) ;
                                                               END
                                                               ELSE
                                                               BEGIN
                                                                               IF @tiposp = 'varchar'
                                                                               SET @sqlCommand =   ',@' + @camposp + ' ' + @tiposp  + '(' + @longitudsp + ')=''''''''' + char(13)+CHAR(10) ;
                                                                               IF @tiposp = 'datetime'
                                                                               SET @sqlCommand =   '@' + @camposp + ' ' + @tiposp  + '=null' + char(13)+CHAR(10) ;
                                                               END
                                                               SET @sqlCommand = 'Insert into #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                                                               exec (@sqlCommand)

                                                               IF @isp = 0 set @insert = @insert  + @camposp
                                                               IF @isp > 0 set @insert = @insert  + ',' + @camposp;

                                                               IF @isp = 0 set @insertValues = @insertValues  + '@' + @camposp;
                                                               IF @isp > 0 set @insertValues = @insertValues  + ',' + '@' + @camposp

                                                               set @isp = @isp +  1;
                                                               end



                                                               SET @sqlCommand =  ',@accion varchar(100)='''''''''  + char(13)+CHAR(10) ;
                                                               SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                                                               exec (@sqlCommand) 

                                                               SET @sqlCommand =  'AS'  + char(13)+CHAR(10) ;
                                                               SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                                                               exec (@sqlCommand) 

                                                               SET @sqlCommand =  'If @accion = ''''Insertar'''''  + char(13)+CHAR(10) ;
                                                               SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                                                               exec (@sqlCommand) 

                                                               SET @sqlCommand =  'BEGIN'  + char(13)+CHAR(10) ;
                                                               SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                                                               exec (@sqlCommand) 

                                                               SET @sqlCommand =  'INSERT INTO ' + @tabla + ' (' + @insert + ')' + char(13)+CHAR(10) ;
                                                               SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                                                               exec (@sqlCommand) 

                                                               SET @sqlCommand =  'Values(' + @insertValues + ')' + char(13)+CHAR(10) ;
                                                               SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                                                               exec (@sqlCommand) 

                                                               SET @sqlCommand =  'END'  + char(13)+CHAR(10) ;
                                                               SET @sqlCommand = 'INSERT INTO #TablaTemporal VALUES ( ''' +  @sqlCommand + '''' + ') '   ;
                                                               exec (@sqlCommand) 
       
                select * from  #TablaTemporal

