object dmDRE: TdmDRE
  OnDestroy = DataModuleDestroy
  Height = 618
  Width = 1144
  object dtDREComparativo: TfrxDBDataset
    UserName = 'dtDREComparativo'
    CloseDataSource = False
    FieldAliases.Strings = (
      'COD_GRUPO_RAIZ=COD_GRUPO_RAIZ'
      'COD_GRUPO_PAI=COD_GRUPO_PAI'
      'DESDOBRAMENTO=DESDOBRAMENTO'
      'COD_GRUPO=COD_GRUPO'
      'DESCRICAO=DESCRICAO'
      'COD_GRUPO_FORMATADO=COD_GRUPO_FORMATADO'
      'ANO=ANO'
      'MES=MES'
      'TOTAL=TOTAL'
      'PF=PF'
      'FATURAMENTO=FATURAMENTO'
      'COR=COR')
    DataSet = qryDREComparativo
    BCDToCurrency = False
    DataSetOptions = []
    Left = 175
    Top = 38
  end
  object qryDREComparativo: TFDQuery
    FieldOptions.UpdatePersistent = True
    Connection = dm.fdRestaurante
    FormatOptions.AssignedValues = [fvMaxBcdPrecision]
    FormatOptions.MaxBcdPrecision = 20
    SQL.Strings = (
      'select * from r_compartivo_dre('#39'01.01.2021'#39','#39'30.06.2021'#39') dr'
      ' ')
    Left = 71
    Top = 30
  end
  object qryResumoDREComparativo: TFDQuery
    FieldOptions.UpdatePersistent = True
    Connection = dm.fdRestaurante
    FormatOptions.AssignedValues = [fvMaxBcdPrecision]
    FormatOptions.MaxBcdPrecision = 20
    SQL.Strings = (
      ''
      ''
      'select * from ('
      
        '                                                                ' +
        '         '
      '      with totais_grupos_rd as'
      
        '        ( select  extract(year from lr.data_rd) as ano, extract(' +
        'month from lr.data_rd) as mes,'
      '                  coalesce(sum(itr.valor),0) as total'
      '                 from itens_lancamento_rd itr'
      
        '                   inner join lancamentos_rd lr on (lr.codigo = ' +
        'itr.cod_lanc_rd)'
      
        '                     where lr.data_rd between '#39'01.01.2021'#39' and '#39 +
        '30.06.2021'#39
      '                     group by 1,2'
      '        ),'
      '       totais_vendas as ('
      '         select'
      '           extract(year from v.data) as ano,'
      '           extract(month from v.data) as mes,'
      '         coalesce(sum(v.valor),0.01) as total'
      '          from recebimentos v'
      '          where v.data between '#39'01.01.2021'#39' and '#39'30.06.2021'#39
      '            group by 1,2'
      '           ),'
      ''
      '       meses_ano as ('
      '          select distinct ano,mes  from'
      '           ('
      '           select distinct rd.ano, rd.mes'
      '              from totais_grupos_rd rd'
      '           union all'
      '           select distinct tv.ano, tv.mes'
      '             from totais_vendas tv'
      '             )'
      '             order by ano,mes'
      '           )'
      ''
      ''
      
        '   select  ms.ano, ms.mes, m.mes ||'#39' '#39'|| cast(ms.ano as varchar(' +
        '4)) as nome_mes , coalesce(tv.total,0.01)  as totalFaturamento, ' +
        'coalesce(rd.total,0) as totalDespesa,'
      
        '       (( coalesce(rd.total,0) / coalesce(tv.total,0.01) ) * 100' +
        ') as PF,'
      
        '       ( coalesce(tv.total,0.01) - coalesce(rd.total,0)) as resu' +
        'ltado,'
      
        '       (( ( coalesce(tv.total,0.01) - coalesce(rd.total,0)) /  c' +
        'oalesce(tv.total,0.01)) * 100) as PCTRest'
      '       from meses_ano ms'
      
        '         left join totais_grupos_rd rd on (rd.ano = ms.ano and r' +
        'd.mes = ms.mes)'
      
        '         left join totais_vendas  tv on (tv.mes = ms.mes and tv.' +
        'ano= rd.ano)'
      '         inner join meses m on (m.id = ms.mes)'
      ''
      '               ) order by ano, mes')
    Left = 71
    Top = 94
  end
  object dtResumoDREComparativo: TfrxDBDataset
    UserName = 'dtResumoDREComparativo'
    CloseDataSource = False
    FieldAliases.Strings = (
      'ANO=ANO'
      'MES=MES'
      'NOME_MES=NOME_MES'
      'TOTALFATURAMENTO=TOTALFATURAMENTO'
      'TOTALDESPESA=TOTALDESPESA'
      'PF=PF'
      'RESULTADO=RESULTADO'
      'PCTREST=PCTREST')
    DataSet = qryResumoDREComparativo
    BCDToCurrency = False
    DataSetOptions = []
    Left = 175
    Top = 94
  end
  object dtDRE: TfrxDBDataset
    UserName = 'dtDRE'
    CloseDataSource = False
    FieldAliases.Strings = (
      'COD_GRUPO=COD_GRUPO'
      'GRUPO=GRUPO'
      'TOTAL_MES=TOTAL_MES'
      'CMV_MES=CMV_MES'
      'CMV_MES_ANT=CMV_MES_ANT'
      'CMV_ANO_ANT=CMV_ANO_ANT'
      'TOTAL_MES_ANTERIOR=TOTAL_MES_ANTERIOR'
      'CRE_MES_ANT=CRE_MES_ANT'
      'TOTAL_ANO_ANTERIOR=TOTAL_ANO_ANTERIOR'
      'CRE_ANO_ANT=CRE_ANO_ANT'
      'P_DESP_MES=P_DESP_MES'
      'P_DESP_M_ANTERIOR=P_DESP_M_ANTERIOR'
      'P_DESP_A_ANTERIOR=P_DESP_A_ANTERIOR')
    DataSet = qryDRE
    BCDToCurrency = False
    DataSetOptions = []
    Left = 151
    Top = 159
  end
  object qryDRE: TFDQuery
    FieldOptions.UpdatePersistent = True
    Connection = dm.fdRestaurante
    FormatOptions.AssignedValues = [fvMaxBcdPrecision]
    FormatOptions.MaxBcdPrecision = 20
    SQL.Strings = (
      ' select cod_grupo,grupo, total_mes,'
      
        '                                                                ' +
        '                                                         '
      
        '         udf_roundabnt(((total_mes * 100) / 283184.12),3) as CMV' +
        '_MES,                                                           ' +
        '            '
      
        '         udf_roundabnt(((total_mes_anterior * 100) / 300271.01),' +
        '3) as CMV_MES_ANT,                                           '
      
        '         udf_roundabnt(((total_ano_anterior * 100) / 387371.04),' +
        '3) as CMV_ANO_ANT,                                              ' +
        '    '
      
        '                                                                ' +
        '                                                         '
      
        '         total_mes_anterior,                                    ' +
        '                                                         '
      
        '         case total_mes                                         ' +
        '                                                         '
      
        '            when  0  then                                       ' +
        '                                                         '
      
        '             100                                                ' +
        '                                                         '
      
        '           else                                                 ' +
        '                                                         '
      
        '            udf_roundabnt( ( ( ( (total_mes - total_mes_anterior' +
        ') * 100) / coalesce(total_mes,1) )),3)                   '
      
        '         end as cre_mes_ant,                                    ' +
        '                                                         '
      
        '                                                                ' +
        '                                                         '
      
        '         total_ano_anterior,                                    ' +
        '                                                         '
      
        '         case total_mes                                         ' +
        '                                                         '
      
        '            when  0  then                                       ' +
        '                                                         '
      
        '             100                                                ' +
        '                                                         '
      
        '           else                                                 ' +
        '                                                         '
      
        '            udf_roundabnt( ( ( ( (total_mes -total_ano_anterior)' +
        ' * 100) / coalesce(total_mes,1) )),3)                    '
      
        '         end as cre_ano_ant ,                                   ' +
        '                                                          '
      
        '       case total_despesas_mes                                  ' +
        '                                              '
      
        '          when  0  then                                         ' +
        '                                              '
      
        '           100                                                  ' +
        '                                              '
      
        '         else                                                   ' +
        '                                              '
      
        '          udf_roundabnt( ( ( ( (total_mes ) * 100) / coalesce(to' +
        'tal_despesas_mes,1) )),3)                     '
      
        '       end as P_DESP_MES,                                       ' +
        '                                              '
      
        '                                                                ' +
        '                                              '
      
        '                                                                ' +
        '                                              '
      
        '       case total_despesas_mes_anterior                         ' +
        '                                              '
      
        '          when  0  then                                         ' +
        '                                              '
      
        '           100                                                  ' +
        '                                              '
      
        '         else                                                   ' +
        '                                              '
      
        '          udf_roundabnt( ( ( ( (total_mes_anterior ) * 100) / co' +
        'alesce(total_despesas_mes_anterior,1) )),3)   '
      
        '       end as P_DESP_M_ANTERIOR,                                ' +
        '                                              '
      
        '                                                                ' +
        '                                              '
      
        '     case total_despesas_ano_anterior                           ' +
        '                                              '
      
        '          when  0  then                                         ' +
        '                                              '
      
        '           100                                                  ' +
        '                                              '
      
        '         else                                                   ' +
        '                                              '
      
        '          udf_roundabnt( ( ( ( (total_ano_anterior ) * 100) / co' +
        'alesce(total_despesas_ano_anterior,1) )),3)   '
      
        '       end as P_DESP_A_ANTERIOR                                 ' +
        '                                              '
      
        '    from (                                                      ' +
        '                                                         '
      
        '             select r.cod_formatado cod_grupo, r.descricao as gr' +
        'upo,                                                     '
      
        '                       (select coalesce(sum(itr.valor),0)       ' +
        '                                                         '
      
        '                          from itens_lancamento_rd itr          ' +
        '                                                         '
      
        '                               inner join lancamentos_rd lr on (' +
        'lr.codigo = itr.cod_lanc_rd)                             '
      
        '                                 where lr.data_rd between '#39'01.01' +
        '.2021'#39' and '#39'31.01.2021'#39'                                '
      
        '                                  and itr.cod_grupo starting wit' +
        'h (r.cod_grupo)                                          '
      
        '                              ) as total_mes,                   ' +
        '                                                         '
      
        '                                                                ' +
        '                                                         '
      
        '                       (select coalesce(sum(itr.valor),0)       ' +
        '                                                         '
      
        '                          from itens_lancamento_rd itr          ' +
        '                                                         '
      
        '                               inner join lancamentos_rd lr on (' +
        'lr.codigo = itr.cod_lanc_rd)                             '
      
        '                                 where lr.data_rd between  '#39'01.1' +
        '2.2020'#39' and '#39'31.12.2020'#39'               '
      
        '                                  and itr.cod_grupo  starting wi' +
        'th (r.cod_grupo)'
      
        '                              ) as total_mes_anterior,          ' +
        '                                                         '
      
        '                                                                ' +
        '                                                         '
      
        '             (select coalesce(sum(itr.valor),0)                 ' +
        '                                                         '
      
        '                          from itens_lancamento_rd itr          ' +
        '                                                         '
      
        '                               inner join lancamentos_rd lr on (' +
        'lr.codigo = itr.cod_lanc_rd)                             '
      
        '                                 where lr.data_rd between  '#39'01/0' +
        '1/2020'#39' and '#39'31.01.2020'#39'             '
      
        '                                  and itr.cod_grupo starting wit' +
        'h (r.cod_grupo)'
      
        '                              ) as total_ano_anterior,          ' +
        '                                                         '
      
        '                                                                ' +
        '                                                         '
      
        '             (select sum(lr.total)                              ' +
        '                                                         '
      
        '                 from lancamentos_rd lr                         ' +
        '                                                         '
      
        '                  where lr.data_rd between '#39'01.01.2021'#39' and '#39'31.' +
        '01.2021'#39'                                               '
      
        '                                                                ' +
        '                                                         '
      
        '              ) as total_despesas_mes,                          ' +
        '                                                         '
      
        '             (select sum(lr.total)                              ' +
        '                                                         '
      
        '                 from lancamentos_rd lr                         ' +
        '                                                         '
      
        '                  where lr.data_rd between '#39'01.12.2020'#39' and '#39'31.' +
        '12.2020'#39'                               '
      
        '                                                                ' +
        '                                                         '
      
        '              ) as total_despesas_mes_anterior,                 ' +
        '                                                         '
      
        '                                                                ' +
        '                                                         '
      
        '             (select sum(lr.total)                              ' +
        '                                                         '
      
        '                 from lancamentos_rd lr                         ' +
        '                                                         '
      
        '                  where lr.data_rd between '#39'01/01/2020'#39' and '#39'31.' +
        '01.2020'#39'                             '
      
        '                                                                ' +
        '                                                         '
      
        '              ) as total_despesas_ano_anterior                  ' +
        '                                                         '
      
        '                                                                ' +
        '                                                         '
      
        '                from r_grupos_rd r                              ' +
        '                                                         '
      '               )')
    Left = 64
    Top = 160
  end
  object dtResumoDRE: TfrxDBDataset
    UserName = 'dtResumoDRE'
    CloseDataSource = False
    FieldAliases.Strings = (
      'FAT_MES_ATUAL=FAT_MES_ATUAL'
      'DESP_MES_ATUAL=DESP_MES_ATUAL'
      'RES_MES_ATUAL=RES_MES_ATUAL'
      'RES_PERC_MES_ATUAL=RES_PERC_MES_ATUAL'
      'FAT_MES_ANTERIOR=FAT_MES_ANTERIOR'
      'DESP_MES_ANTERIOR=DESP_MES_ANTERIOR'
      'RES_MES_ANTERIOR=RES_MES_ANTERIOR'
      'RES_PERC_MES_ANTERIOR=RES_PERC_MES_ANTERIOR'
      'FAT_ANO_ANTERIOR=FAT_ANO_ANTERIOR'
      'DESP_ANO_ANTERIOR=DESP_ANO_ANTERIOR'
      'RES_ANO_ANTERIOR=RES_ANO_ANTERIOR'
      'RES_PERC_ANO_ANTERIOR=RES_PERC_ANO_ANTERIOR'
      'CRESC_FAT_MES_ANT=CRESC_FAT_MES_ANT'
      'CRESC_FAT_AN_ANTERIOR=CRESC_FAT_AN_ANTERIOR'
      'CRESC_DESP_MES_ANTERIOR=CRESC_DESP_MES_ANTERIOR'
      'CRESC_DESP_ANO_ANTERIOR=CRESC_DESP_ANO_ANTERIOR'
      'CRES_RES_MES_ANT=CRES_RES_MES_ANT'
      'CRES_RES_ANO_ANT=CRES_RES_ANO_ANT'
      'PERC_FAT_DESP_MES_ATUAL=PERC_FAT_DESP_MES_ATUAL'
      'PERC_FAT_DESP_MES_ANTERIOR=PERC_FAT_DESP_MES_ANTERIOR'
      'PERC_FAT_DESP_ANO_ANTERIOR=PERC_FAT_DESP_ANO_ANTERIOR')
    DataSet = qryResumoDRE
    BCDToCurrency = False
    DataSetOptions = []
    Left = 158
    Top = 234
  end
  object qryResumoDRE: TFDQuery
    FieldOptions.UpdatePersistent = True
    Connection = dm.fdRestaurante
    FormatOptions.AssignedValues = [fvMaxBcdPrecision]
    FormatOptions.MaxBcdPrecision = 20
    SQL.Strings = (
      
        'select res.*,                                                   ' +
        '                                                       '
      
        '          case res_mes_anterior                                 ' +
        '                                                        '
      
        '                  when 0 then 100                               ' +
        '                                                        '
      
        '                  else                                          ' +
        '                                                        '
      
        '                     udf_roundabnt( ( ( ( (res_mes_atual - res_m' +
        'es_anterior) * 100) / coalesce(res_mes_anterior,1) )),3)'
      
        '                end as CRES_RES_MES_ANT,                        ' +
        '                                                        '
      
        '                                                                ' +
        '                                                        '
      
        '        case res_ano_anterior                                   ' +
        '                                                        '
      
        '                  when 0 then 100                               ' +
        '                                                        '
      
        '                  else                                          ' +
        '                                                        '
      
        '                     udf_roundabnt( ( ( ( (res_mes_atual - res_a' +
        'no_anterior) * 100) / coalesce(res_ano_anterior,1) )),3)'
      
        '                end as CRES_RES_ANO_ANT,                        ' +
        '                                                        '
      
        '          case fat_mes_atual                                    ' +
        '                                                        '
      
        '                  when 0 then 100                               ' +
        '                                                        '
      
        '                  else                                          ' +
        '                                                        '
      
        '                     udf_roundabnt( ( ( ( (desp_mes_atual) * 100' +
        ') / coalesce(fat_mes_atual,1) )),3)                     '
      
        '                end as PERC_FAT_DESP_MES_ATUAL,                 ' +
        '                                                        '
      
        '                                                                ' +
        '                                                        '
      
        '         case fat_mes_anterior                                  ' +
        '                                                        '
      
        '                  when 0 then 100                               ' +
        '                                                        '
      
        '                  else                                          ' +
        '                                                        '
      
        '                     udf_roundabnt( ( ( ( (desp_mes_anterior) * ' +
        '100) / coalesce(fat_mes_anterior,1) )),3)               '
      
        '                end as PERC_FAT_DESP_MES_ANTERIOR,              ' +
        '                                                        '
      
        '                                                                ' +
        '                                                        '
      
        '         case fat_ano_anterior                                  ' +
        '                                                        '
      
        '                  when 0 then 100                               ' +
        '                                                        '
      
        '                  else                                          ' +
        '                                                        '
      
        '                     udf_roundabnt( ( ( ( (desp_ano_anterior) * ' +
        '100) / coalesce(fat_ano_anterior,1) )),3)               '
      
        '                end as PERC_FAT_DESP_ANO_ANTERIOR               ' +
        '                                                        '
      
        '                                                                ' +
        '                                                        '
      
        '                                                                ' +
        '                                                        '
      '      from '
      
        '    (                                                           ' +
        '                                                               '
      
        '    select fat_mes_atual,desp_mes_atual,                        ' +
        '                                                               '
      
        '         (fat_mes_atual - desp_mes_atual) as res_mes_atual,     ' +
        '                                                               '
      
        '         udf_roundabnt(( ( (fat_mes_atual - desp_mes_atual) * 10' +
        '0) / fat_mes_atual),3) as res_perc_mes_atual,                  '
      
        '         fat_mes_anterior, desp_mes_anterior,                   ' +
        '                                                               '
      
        '        (fat_mes_anterior - desp_mes_anterior) as res_mes_anteri' +
        'or,                                                            '
      
        '        udf_roundabnt(( ( (fat_mes_anterior - desp_mes_anterior)' +
        ' * 100) / fat_mes_anterior),3) as res_perc_mes_anterior,       '
      
        '    fat_ano_anterior, desp_ano_anterior,                        ' +
        '                                                               '
      
        '        (fat_ano_anterior - desp_ano_anterior) as res_ano_anteri' +
        'or,                                                            '
      
        '        udf_roundabnt(( ( (fat_ano_anterior - desp_ano_anterior)' +
        ' * 100) / fat_ano_anterior),3) as res_perc_ano_anterior,       '
      
        '                                                                ' +
        '                                                               '
      
        '               case fat_mes_anterior                            ' +
        '                                                               '
      
        '                 when 0 then 100                                ' +
        '                                                               '
      
        '                 else                                           ' +
        '                                                               '
      
        '                    udf_roundabnt( ( ( ( (fat_mes_atual - fat_me' +
        's_anterior) * 100) / coalesce(fat_mes_anterior,1) )),3)        '
      
        '               end as CRESC_FAT_MES_ANT,                        ' +
        '                                                               '
      
        '              case fat_ano_anterior                             ' +
        '                                                               '
      
        '                 when 0 then 100                                ' +
        '                                                               '
      
        '                 else                                           ' +
        '                                                               '
      
        '                    udf_roundabnt( ( ( ( (fat_mes_atual - fat_an' +
        'o_anterior) * 100) / coalesce(fat_ano_anterior,1) )),3)        '
      
        '               end as CRESC_FAT_AN_ANTERIOR,                    ' +
        '                                                               '
      
        '              case desp_mes_anterior                            ' +
        '                                                               '
      
        '                 when 0 then 100                                ' +
        '                                                               '
      
        '                 else                                           ' +
        '                                                               '
      
        '                    udf_roundabnt( ( ( ( (desp_mes_atual - desp_' +
        'mes_anterior) * 100) / coalesce(desp_mes_anterior,1) )),3)      ' +
        '  '
      
        '               end as CRESC_DESP_MES_ANTERIOR,                  ' +
        '                                                               '
      
        '              case desp_ano_anterior                            ' +
        '                                                               '
      
        '                 when 0 then 100                                ' +
        '                                                               '
      
        '                 else                                           ' +
        '                                                               '
      
        '                    udf_roundabnt( ( ( ( (desp_mes_atual - desp_' +
        'ano_anterior) * 100) / coalesce(desp_ano_anterior,1) )),3)      ' +
        '  '
      
        '           end as CRESC_DESP_ANO_ANTERIOR                       ' +
        '                                                               '
      
        '         from                                                   ' +
        '                                                        '
      
        '         (                                                      ' +
        '                                       '
      
        '          select first 1                                        ' +
        '                                       '
      
        '          (select coalesce(sum(pj.faturamento_real),0)          ' +
        '                                       '
      
        '              from projecoes_receitas_rd pj                     ' +
        '                                       '
      
        '                where pj.data between '#39'01.01.2021'#39' and '#39'31.01.20' +
        '21'#39') as fat_mes_atual,                              '
      
        '          (select coalesce(sum(pj.faturamento_real),0)          ' +
        '                                       '
      
        '              from projecoes_receitas_rd pj                     ' +
        '                                       '
      
        '                where pj.data between '#39'01.12.2020'#39' and '#39'31.12.20' +
        '20'#39') as fat_mes_anterior,                        '
      
        '                                                                ' +
        '                                       '
      
        '          (select coalesce(sum(pj.faturamento_real),0)          ' +
        '                                       '
      
        '              from projecoes_receitas_rd pj                     ' +
        '                                       '
      
        '                where pj.data between '#39'01/01/2020'#39' and '#39'31.01.20' +
        '20'#39') as fat_ano_anterior,                         '
      
        '        (select sum(lr.total ) from lancamentos_rd lr           ' +
        '              '
      
        '         where lr.data_rd between '#39'01.01.2021'#39' and '#39'31.01.2021'#39')' +
        ' as desp_mes_atual,     '
      
        '                                                                ' +
        '              '
      
        '        (select sum(lr.total ) from lancamentos_rd lr           ' +
        '              '
      
        '         where lr.data_rd between '#39'01.12.2020'#39' and '#39'31.12.2020'#39')' +
        ' as desp_mes_anterior,  '
      
        '                                                                ' +
        '              '
      
        '        (select sum(lr.total ) from lancamentos_rd lr           ' +
        '              '
      
        '         where lr.data_rd between '#39'01/01/2020'#39' and '#39'31.01.2020'#39')' +
        ' as desp_ano_anterior       '
      
        '             from parametros p                                  ' +
        '                                       '
      '          )) res ')
    Left = 64
    Top = 240
  end
  object dsQryDRE: TDataSource
    DataSet = qryDRE
    Left = 216
    Top = 160
  end
end
