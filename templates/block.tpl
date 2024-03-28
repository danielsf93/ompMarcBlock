{if isset($publication)}
    <div class="pkp_block block_ompmarckblock">
        <h2>
            ompMarcBlock
        </h2>
        {$filomena}<br>
        TESTES AQUI:<br>
       inicio

<b>

{$publication->getData('submissionId')}<br>



</b>
        fim
        <hr>
      
      
{* Pegar o ISBN *}
        {assign var="isbn" value=""}
        {foreach $publication->getData('publicationFormats') as $publicationFormat}
            {assign var="identificationCodes" value=$publicationFormat->getIdentificationCodes()}
            {while $identificationCode = $identificationCodes->next()}
                {if $identificationCode->getCode() == '02' || $identificationCode->getCode() == '15'}
                    {assign var="isbn" value=$identificationCode->getValue()|replace:"-":""|replace:".":""}
                    {break} {* Encerra o loop ao encontrar o ISBN *}
                {/if}
            {/while}
        {/foreach}
        

{* Organizando a Informação *}

    {assign var="dataFormatada" value=$smarty.now|date_format:"%Y%m%d%H%M%S.0"}
    {assign var="zeroZeroCinco" value="$dataFormatada"}

    {assign var="zeroZeroOito" value="      s2023    bl            000 0 por d"}

    {assign var="zeroDoisZero" value="  a{if $isbn|trim}{$isbn}{else}{/if}7 "}
        
    {assign var="zeroDoisQuatro" value="a{$publication->getStoredPubId('doi')|escape}2DOI"}

    {assign var="zeroQuatroZero" value="  aUSP/ABCD0 "}

    {assign var="zeroQuatroUm" value="apor  "}

    {assign var="zeroQuatroQuatro" value="abl1 "}


     {* Obter Primeiro Autor *}
{assign var="authors" value=$publication->getData('authors')}
{if $authors|@count > 0}
    {assign var="firstAuthor" value=$authors[0]}
    {assign var="givenName" value=$firstAuthor->getLocalizedGivenName()|escape}
    {assign var="surname" value=$firstAuthor->getLocalizedFamilyName()|escape}
    {assign var="orcid" value=$firstAuthor->getOrcid()|default:''}
    {assign var="affiliation" value=$firstAuthor->getLocalizedAffiliation()|default:''}
    {assign var="locale" value=$firstAuthor->getCountryLocalized()|escape}

    {if $affiliation|strstr:'Universidade de São Paulo'}
        {if $orcid}
            {assign var="umZeroZero" value="a{$surname}, {$givenName}0{$orcid}4org5(*)"}
        {else}
            {assign var="umZeroZero" value="a{$surname}, {$givenName}0 4org5(*)"}
        {/if}
    {else}
        {if $orcid && $affiliation}
            {assign var="umZeroZero" value="a{$surname}, {$givenName}0{$orcid}5(*)7INT8{$affiliation}9{$locale}"}
        {elseif $orcid}
            {assign var="umZeroZero" value="a{$surname}, {$givenName}0{$orcid}5(*)7INT9{$locale}"}
        {elseif $affiliation}
            {assign var="umZeroZero" value="a{$surname}, {$givenName}7INT8{$affiliation}9{$locale}"}
        {else}
            {assign var="umZeroZero" value="a{$surname}, {$givenName}5(*)9{$locale}"}
        {/if}
    {/if}
{/if}


    {assign var="doisQuatroCinco" value="10a{$publication->getLocalizedFullTitle()|escape}h[recurso eletrônico]  "}




{* Obter Cidade pelo Copyright *}
{assign var="copyrightHolder" value=$publication->getLocalizedData('copyrightHolder')}
{assign var="local" value="LOCAL"} 

{if $copyrightHolder == "Universidade de São Paulo. Escola de Artes, Ciências e Humanidades" || $copyrightHolder == "Universidade de São Paulo. Escola de Artes, Ciências e Humanidades "
|| $copyrightHolder == "Universidade de São Paulo. Escola de Comunicações e Artes" || $copyrightHolder == "Universidade de São Paulo. Escola de Comunicações e Artes "
|| $copyrightHolder == "Universidade de São Paulo. Escola de Educação Física e Esporte" || $copyrightHolder == "Universidade de São Paulo. Escola de Educação Física e Esporte "
|| $copyrightHolder == "Universidade de São Paulo. Escola de Enfermagem" || $copyrightHolder == "Universidade de São Paulo. Escola de Enfermagem "
|| $copyrightHolder == "Universidade de São Paulo. Escola Politécnica" || $copyrightHolder == "Universidade de São Paulo. Escola Politécnica "
|| $copyrightHolder == "Universidade de São Paulo. Faculdade de Arquitetura e Urbanismo" || $copyrightHolder == "Universidade de São Paulo. Faculdade de Arquitetura e Urbanismo "
|| $copyrightHolder == "Universidade de São Paulo. Faculdade de Ciências Farmacêuticas" || $copyrightHolder == "Universidade de São Paulo. Faculdade de Ciências Farmacêuticas "
|| $copyrightHolder == "Universidade de São Paulo. Faculdade de Direito" || $copyrightHolder == "Universidade de São Paulo. Faculdade de Direito "
|| $copyrightHolder == "Universidade de São Paulo. Faculdade de Economia, Administração e Contabilidade" || $copyrightHolder == "Universidade de São Paulo. Faculdade de Economia, Administração e Contabilidade "
|| $copyrightHolder == "Universidade de São Paulo. Faculdade de Educação" || $copyrightHolder == "Universidade de São Paulo. Faculdade de Educação "
|| $copyrightHolder == "Universidade de São Paulo. Faculdade de Filosofia, Letras e Ciências Humanas" || $copyrightHolder == "Universidade de São Paulo. Faculdade de Filosofia, Letras e Ciências Humanas "
|| $copyrightHolder == "Universidade de São Paulo. Faculdade de Medicina" || $copyrightHolder == "Universidade de São Paulo. Faculdade de Medicina "
|| $copyrightHolder == "Universidade de São Paulo. Faculdade de Medicina Veterinária e Zootecnia" || $copyrightHolder == "Universidade de São Paulo. Faculdade de Medicina Veterinária e Zootecnia "
|| $copyrightHolder == "Universidade de São Paulo. Faculdade de Odontologia" || $copyrightHolder == "Universidade de São Paulo. Faculdade de Odontologia "
|| $copyrightHolder == "Universidade de São Paulo. Faculdade de Saúde Pública" || $copyrightHolder == "Universidade de São Paulo. Faculdade de Saúde Pública "
|| $copyrightHolder == "Universidade de São Paulo. Instituto de Astronomia, Geofísica e Ciências Atmosféricas" || $copyrightHolder == "Universidade de São Paulo. Instituto de Astronomia, Geofísica e Ciências Atmosféricas "
|| $copyrightHolder == "Universidade de São Paulo. Instituto de Biociências" || $copyrightHolder == "Universidade de São Paulo. Instituto de Biociências "
|| $copyrightHolder == "Universidade de São Paulo. Instituto de Ciências Biomédicas" || $copyrightHolder == "Universidade de São Paulo. Instituto de Ciências Biomédicas "
|| $copyrightHolder == "Universidade de São Paulo. Instituto de Energia e Ambiente" || $copyrightHolder == "Universidade de São Paulo. Instituto de Energia e Ambiente "
|| $copyrightHolder == "Universidade de São Paulo. Instituto de Estudos Avançados" || $copyrightHolder == "Universidade de São Paulo. Instituto de Estudos Avançados "
|| $copyrightHolder == "Universidade de São Paulo. Instituto de Estudos Brasileiros" || $copyrightHolder == "Universidade de São Paulo. Instituto de Estudos Brasileiros "
|| $copyrightHolder == "Universidade de São Paulo. Instituto de Física" || $copyrightHolder == "Universidade de São Paulo. Instituto de Física "
|| $copyrightHolder == "Universidade de São Paulo. Instituto de Geociências" || $copyrightHolder == "Universidade de São Paulo. Instituto de Geociências "
|| $copyrightHolder == "Universidade de São Paulo. Instituto de Matemática e Estatística" || $copyrightHolder == "Universidade de São Paulo. Instituto de Matemática e Estatística "
|| $copyrightHolder == "Universidade de São Paulo. Instituto de Medicina Tropical de São Paulo" || $copyrightHolder == "Universidade de São Paulo. Instituto de Medicina Tropical de São Paulo "
|| $copyrightHolder == "Universidade de São Paulo. Instituto de Psicologia" || $copyrightHolder == "Universidade de São Paulo. Instituto de Psicologia "
|| $copyrightHolder == "Universidade de São Paulo. Instituto de Química" || $copyrightHolder == "Universidade de São Paulo. Instituto de Química "
|| $copyrightHolder == "Universidade de São Paulo. Instituto de Relações Internacionais" || $copyrightHolder == "Universidade de São Paulo. Instituto de Relações Internacionais "
|| $copyrightHolder == "Universidade de São Paulo. Instituto Oceanográfico" || $copyrightHolder == "Universidade de São Paulo. Instituto Oceanográfico "
|| $copyrightHolder == "Universidade de São Paulo. Museu de Arqueologia e Etnografia" || $copyrightHolder == "Universidade de São Paulo. Museu de Arqueologia e Etnografia "
|| $copyrightHolder == "Universidade de São Paulo. Museu de Arte Contemporânea" || $copyrightHolder == "Universidade de São Paulo. Museu de Arte Contemporânea "
|| $copyrightHolder == "Universidade de São Paulo. Museu Paulista" || $copyrightHolder == "Universidade de São Paulo. Museu Paulista "
|| $copyrightHolder == "Universidade de São Paulo. Museu de Zoologia" || $copyrightHolder == "Universidade de São Paulo. Museu de Zoologia "
 }
    {assign var="local" value="São Paulo"}

{elseif $copyrightHolder == "Universidade de São Paulo. Faculdade de Odontologia de Bauru" || $copyrightHolder == "Universidade de São Paulo. Faculdade de Odontologia de Bauru "
|| $copyrightHolder == "Universidade de São Paulo. Hospital de Reabilitação de Anomalias Craniofaciais" || $copyrightHolder == "Universidade de São Paulo. Hospital de Reabilitação de Anomalias Craniofaciais "
}
    {assign var="local" value="Bauru"}

{elseif $copyrightHolder == "Universidade de São Paulo. Escola de Engenharia de Lorena" || $copyrightHolder == "Universidade de São Paulo. Escola de Engenharia de Lorena "
}
    {assign var="local" value="Lorena"}

{elseif $copyrightHolder == "Universidade de São Paulo. Centro de Energia Nuclear na Agricultura" || $copyrightHolder == "Universidade de São Paulo. Centro de Energia Nuclear na Agricultura "
|| $copyrightHolder == "Universidade de São Paulo. Escola Superior de Agricultura Luiz de Queiroz" || $copyrightHolder == "Universidade de São Paulo. Escola Superior de Agricultura Luiz de Queiroz "
}
    {assign var="local" value="Piracicaba"}

{elseif $copyrightHolder == "Universidade de São Paulo. Faculdade de Zootecnia e Engenharia de Alimentos" || $copyrightHolder == "Universidade de São Paulo. Faculdade de Zootecnia e Engenharia de Alimentos "
}
    {assign var="local" value="Pirassununga"}

{elseif $copyrightHolder == "Universidade de São Paulo. Escola de Educação Física e Esporte de Ribeirão Preto" || $copyrightHolder == "Universidade de São Paulo. Escola de Educação Física e Esporte de Ribeirão Preto "
|| $copyrightHolder == "Universidade de São Paulo. Escola de Enfermagem de Ribeirão Preto" || $copyrightHolder == "Universidade de São Paulo. Escola de Enfermagem de Ribeirão Preto "
|| $copyrightHolder == "Universidade de São Paulo. Faculdade de Ciências Farmacêuticas de Ribeirão Preto" || $copyrightHolder == "Universidade de São Paulo. Faculdade de Ciências Farmacêuticas de Ribeirão Preto "
|| $copyrightHolder == "Universidade de São Paulo. Faculdade de Direito de Ribeirão Preto" || $copyrightHolder == "Universidade de São Paulo. Faculdade de Direito de Ribeirão Preto "
|| $copyrightHolder == "Universidade de São Paulo. Faculdade de Economia, Administração e Contabilidade de Ribeirão Preto" || $copyrightHolder == "Universidade de São Paulo. Faculdade de Economia, Administração e Contabilidade de Ribeirão Preto "
|| $copyrightHolder == "Universidade de São Paulo. Faculdade de Filosofia, Ciências e Letras de Ribeirão Preto" || $copyrightHolder == "Universidade de São Paulo. Faculdade de Filosofia, Ciências e Letras de Ribeirão Preto "
|| $copyrightHolder == "Universidade de São Paulo. Faculdade de Medicina de Ribeirão Preto" || $copyrightHolder == "Universidade de São Paulo. Faculdade de Medicina de Ribeirão Preto "
|| $copyrightHolder == "Universidade de São Paulo. Faculdade de Odontologia de Ribeirão Preto" || $copyrightHolder == "Universidade de São Paulo. Faculdade de Odontologia de Ribeirão Preto "
}
    {assign var="local" value="Ribeirão Preto"}

{elseif $copyrightHolder == "Universidade de São Paulo. Departamento de Engenharia de Minas e Petróleo" || $copyrightHolder == "Universidade de São Paulo. Departamento de Engenharia de Minas e Petróleo "
}
    {assign var="local" value="Santos"}

{elseif $copyrightHolder == "Universidade de São Paulo.  Escola de Engenharia de São Carlos" || $copyrightHolder == "Universidade de São Paulo.  Escola de Engenharia de São Carlos "
|| $copyrightHolder == "Universidade de São Paulo.  Instituto de Arquitetura e Urbanismo" || $copyrightHolder == "Universidade de São Paulo.  Instituto de Arquitetura e Urbanismo "
|| $copyrightHolder == "Universidade de São Paulo.  Instituto de Ciências Matemáticas e de Computação" || $copyrightHolder == "Universidade de São Paulo.  Instituto de Ciências Matemáticas e de Computação "
|| $copyrightHolder == "Universidade de São Paulo.  Instituto de Física de São Carlos" || $copyrightHolder == "Universidade de São Paulo.  Instituto de Física de São Carlos "
|| $copyrightHolder == "Universidade de São Paulo.  Instituto de Química de São Carlos" || $copyrightHolder == "Universidade de São Paulo.  Instituto de Química de São Carlos "
}
    {assign var="local" value="São Carlos"}

{else}
    {assign var="local" value=""}
{/if}

{assign var="holder" value=$publication->getLocalizedData('copyrightHolder')}
{if $holder|strstr:'Universidade de São Paulo. '}
    {assign var="holder" value=$holder|replace:'Universidade de São Paulo. ':''}
{/if}

{assign var="doisMeiaZero" value="a {$local}b{$holder}c{$publication->getData('copyrightYear')}0 "}

{assign var="quatroNoveZero" value=""}
{if $series}
    {assign var="seriesTitle" value=$series->getLocalizedFullTitle()}
    {if $seriesTitle}
        {assign var="quatroNoveZero" value="a {$seriesTitle}"}
    {/if}
{else}
    {assign var="quatroNoveZero" value="a "}
{/if}

{if $publication->getData('seriesPosition')}
    {assign var="quatroNoveZero" value=$quatroNoveZero|cat:"v {$publication->getData('seriesPosition')}"}
{else}
    {assign var="quatroNoveZero" value=$quatroNoveZero|cat:"v "}
{/if}

{assign var="quatroNoveZero" value=$quatroNoveZero|cat:"  "}





    {assign var="cincoZeroZero" value="aDisponível em: http://{$smarty.server.HTTP_HOST}{$smarty.server.REQUEST_URI}. Acesso em: {$smarty.now|date_format:"%d.%m.%Y"}"}

{* Demais autores *}
{assign var="additionalAuthors" value=[]}
{foreach $authors as $index => $author}
    {if $index != 0}
        {assign var="additionalAuthors" value=array_merge($additionalAuthors, [$author])}
    {/if}
{/foreach}

{assign var="additionalAuthorsExport" value=""}

{foreach $additionalAuthors as $additionalAuthor}
    {assign var="givenName" value=$additionalAuthor->getLocalizedGivenName()|escape}
    {assign var="surname" value=$additionalAuthor->getLocalizedFamilyName()|escape}
    {assign var="orcid" value=$additionalAuthor->getOrcid()|default:''}
    {assign var="affiliation" value=$additionalAuthor->getLocalizedAffiliation()|default:''}

    {assign var="authorExportString" value="1 a{$surname}, {$givenName}"} 

    {if $orcid}
        {assign var="authorExportString" value="$authorExportString0{$orcid}"}
    {else}
        {assign var="authorExportString" value="$authorExportString0 "} 
    {/if}

    {assign var="authorExportString" value="$authorExportString4org"} 

    {assign var="additionalAuthorsExport" value="$additionalAuthorsExport$authorExportString"} 
{/foreach}
   
    {assign var="oitoCincoMeiaA" value="4 zClicar sobre o botão para acesso ao texto completouhttps://doi.org/{$publication->getStoredPubId('doi')|escape}3DOI"}

    {assign var="oitoCincoMeiaB" value="41zClicar sobre o botão para acesso ao texto completouhttp://0.0.0.0:8888/index.php/portaldelivrosUSP/catalog/view/8/8/433Portal de Livros Abertos da USP  "}

    {assign var="noveQuatroCinco" value="aPbMONOGRAFIA/LIVROc06j2023lNACIONAL"}
    


{assign var="ldr" value="01131nam 22000241a 4500 "} 

{* Calculando o comprimento da variável $rec005 *}
{assign var="rec005POS" value=0}
{assign var="rec005CAR" value=sprintf('%04d', strlen($zeroZeroCinco) + $rec005POS)}
{assign var="rec005" value="005"|cat:$rec005CAR|cat:sprintf('%05d', $rec005POS)}

{* Calculando o comprimento da variável $rec008 *}
{assign var="rec008POS" value=$rec005CAR + $rec005POS}
{assign var="rec008CAR" value=sprintf('%04d', strlen($zeroZeroOito) + 0)}
{assign var="rec008" value="008"|cat:$rec008CAR|cat:sprintf('%05d', $rec008POS)}

{* Calculando o comprimento da variável $rec020 *}
{assign var="rec020POS" value=$rec008CAR + $rec008POS}
{assign var="rec020CAR" value=sprintf('%04d', strlen($zeroDoisZero) - 3)}
{assign var="rec020" value="020"|cat:$rec020CAR|cat:sprintf('%05d', $rec020POS)}

{* Calculando o comprimento da variável $rec024 *}
{assign var="rec024POS" value=$rec020CAR + $rec020POS}
{assign var="rec024CAR" value=sprintf('%04d', strlen($zeroDoisQuatro) + 3)}
{assign var="rec024" value="024"|cat:$rec024CAR|cat:sprintf('%05d', $rec024POS)}

{* Calculando o comprimento da variável $rec040 *}
{assign var="rec040POS" value=$rec024CAR + $rec024POS}
{assign var="rec040CAR" value=sprintf('%04d', strlen($zeroQuatroZero) - 3)}
{assign var="rec040" value="040"|cat:$rec040CAR|cat:sprintf('%05d', $rec040POS)}

{* Calculando o comprimento da variável $rec041 *}
{assign var="rec041POS" value=$rec040CAR + $rec040POS}
{assign var="rec041CAR" value=sprintf('%04d', strlen($zeroQuatroUm) + 0)}
{assign var="rec041" value="041"|cat:$rec041CAR|cat:sprintf('%05d', $rec041POS)}

{* Calculando o comprimento da variável $rec044 *}
{assign var="rec044POS" value=$rec041CAR + $rec041POS}
{assign var="rec044CAR" value=sprintf('%04d', strlen($zeroQuatroQuatro) + 0)}
{assign var="rec044" value="044"|cat:$rec044CAR|cat:sprintf('%05d', $rec044POS)}

{* Calculando o comprimento da variável $rec100 *}
{assign var="rec100POS" value=$rec044CAR + $rec044POS}
{assign var="rec100CAR" value=sprintf('%04d', strlen($umZeroZero) + 3)}
{assign var="rec100" value="100"|cat:$rec100CAR|cat:sprintf('%05d', $rec100POS)}

{* Calculando o comprimento da variável $rec245 *}
{assign var="rec245POS" value=$rec100CAR + $rec100POS}
{assign var="rec245CAR" value=sprintf('%04d', strlen($doisQuatroCinco) - 3)}
{assign var="rec245" value="245"|cat:$rec245CAR|cat:sprintf('%05d', $rec245POS)}

{assign var="rec260POS" value=$rec245CAR + $rec245POS}
{assign var="rec260CAR" value=sprintf('%04d', strlen($doisMeiaZero) + 0)}
{assign var="rec260" value="260"|cat:$rec260CAR|cat:sprintf('%05d', $rec260POS)}

{assign var="rec490POS" value=$rec260CAR + $rec260POS}
{assign var="rec490CAR" value=sprintf('%04d', strlen($quatroNoveZero) + 3)}
{assign var="rec490" value="490"|cat:$rec490CAR|cat:sprintf('%05d', $rec490POS)}

{assign var="rec500POS" value=$rec490CAR + $rec490POS}
{assign var="rec500CAR" value=sprintf('%04d', strlen($cincoZeroZero) + 3)}
{assign var="rec500" value="500"|cat:$rec500CAR|cat:sprintf('%05d', $rec500POS - 3)}


{assign var="numAutoresAdicionais" value=count($additionalAuthors)}
{assign var="rec700All" value=''} 

{foreach $additionalAuthors as $additionalAuthor}
    {assign var="rec700" value=''} 
    
    {assign var="rec700POS" value=sprintf('%05d', $rec500CAR + $rec500POS)}
    
    {assign var="seteZeroZero" value="1 a{$additionalAuthor->getLocalizedFamilyName()|escape}, {$additionalAuthor->getLocalizedGivenName()|escape}"}

    {if $additionalAuthor->getOrcid()}
        {assign var="seteZeroZero" value="$seteZeroZero0{$additionalAuthor->getOrcid()}"} 
    {else}
        {assign var="seteZeroZero" value="$seteZeroZero0 "} 
    {/if}

    {assign var="seteZeroZero" value="$seteZeroZero4org"}

    {assign var="rec700CAR" value=sprintf('%04d', strlen($seteZeroZero))}

    {assign var="rec700" value=$rec700|cat:"700"|cat:$rec700CAR|cat:$rec700POS - 3|cat:$seteZeroZero|cat:"  "}
    
    {assign var="rec500POS" value=$rec700POS}
    {assign var="rec500CAR" value=$rec700CAR}
    
    {assign var="rec700All" value=$rec700All|cat:$rec700} 
{/foreach}

{assign var="rec700All" value=str_replace(" ", "", $rec700All)}


{assign var="rec856APOS" value=sprintf('%05d', $rec500CAR + $rec500POS)}
{assign var="rec856ACAR" value=sprintf('%04d', strlen($oitoCincoMeiaA) - 1)}

{if $numAutoresAdicionais > 0}
    {assign var="rec856APOS" value=sprintf('%05d', $rec700CAR + $rec700POS)}
    {assign var="rec856ACAR" value=sprintf('%04d', strlen($oitoCincoMeiaA) - 1)}
{/if}

{assign var="rec856A" value="856"|cat:$rec856ACAR|cat:$rec856APOS - 3}

{assign var="rec856BPOS" value=sprintf('%05d', $rec856ACAR + $rec856APOS)}
{assign var="rec856BCAR" value=sprintf('%04d', strlen($oitoCincoMeiaB) - 2)}
{assign var="rec856B" value="856"|cat:$rec856BCAR|cat:$rec856BPOS - 3}

{assign var="rec945POS" value=sprintf('%05d', $rec856BCAR + $rec856BPOS)}
{assign var="rec945CAR" value=sprintf('%04d', strlen($noveQuatroCinco) + 1)}
{assign var="rec945" value="945"|cat:$rec945CAR|cat:$rec945POS - 3}


{* Chamando a informação numérica para printar na tela*}
<hr>
{$ldr}<br>
{$rec005}<br>
{$rec008}<br>
{$rec020}<br>
{$rec024}<br>
{$rec040}<br>
{$rec041}<br>
{$rec044}<br>
{$rec100}<br>
{$rec245}<br>
{$rec260}<br>
{$rec490}<br>
{$rec500}<br>
{$rec700All}<br>
{$rec856A}<br>
{$rec856B}<br>
{$rec945}<br>


<hr>
{* Chamando a informação de texto para printar na tela*}
        
        <b>005=</b>{$zeroZeroCinco}<br>
        <b>008=</b>{$zeroZeroOito}<br>
        <b>020=</b>{$zeroDoisZero}<br>
        <b>024=</b>{$zeroDoisQuatro}<br>
        <b>040=</b>{$zeroQuatroZero}<br>
        <b>041=</b>{$zeroQuatroUm}<br>
        <b>044=</b>{$zeroQuatroQuatro}<br>
        <b>100=</b>{$umZeroZero}<br>
        <b>245=</b>{$doisQuatroCinco}<br>
        <b>260=</b>{$doisMeiaZero}<br>
        <b>490=</b>{$quatroNoveZero}<br>
        <b>500=</b>{$cincoZeroZero}<br>

{if $additionalAuthorsExport}
    
    <b>700=</b>{$additionalAuthorsExport|escape}<br>
    
{/if}
        <b>856=</b>{$oitoCincoMeiaA}<br>
        <b>856=</b>{$oitoCincoMeiaB}<br>
        <b>945=</b>{$noveQuatroCinco}<br>

<hr>

  
    <button id="downloadButton" class="botao">Baixar Arquivo MARC</button>


{assign var="numAutoresAdicionais" value=$additionalAuthors|count}
{assign var="totalautores" value=22000205+($numAutoresAdicionais*12)}

<script>
    document.addEventListener('DOMContentLoaded', function() {
        var downloadButton = document.getElementById('downloadButton');
        downloadButton.addEventListener('click', function() {
            var text = "00972nam {$totalautores}a 4500 {$rec005|escape:'javascript'}{$rec008|escape:'javascript'}{$rec020|escape:'javascript'}{$rec024|escape:'javascript'}{$rec040|escape:'javascript'}{$rec041|escape:'javascript'}{$rec044|escape:'javascript'}{$rec100|escape:'javascript'}{$rec245|escape:'javascript'}{$rec260|escape:'javascript'}{$rec490|escape:'javascript'}{$rec500|escape:'javascript'}{$rec700All|escape:'javascript'}{$rec856A|escape:'javascript'}{$rec856B|escape:'javascript'}{$rec945|escape:'javascript'}{$zeroZeroCinco|escape:'javascript'}{$zeroZeroOito|escape:'javascript'}{$zeroDoisZero|escape:'javascript'}{$zeroDoisQuatro|escape:'javascript'}{$zeroQuatroZero|escape:'javascript'}{$zeroQuatroUm|escape:'javascript'}{$zeroQuatroQuatro|escape:'javascript'}{$umZeroZero|escape:'javascript'}{$doisQuatroCinco|escape:'javascript'}{$doisMeiaZero|escape:'javascript'}{$quatroNoveZero|escape:'javascript'}{$cincoZeroZero|escape:'javascript'}{$additionalAuthorsExport|escape:'javascript'}{$oitoCincoMeiaA|escape:'javascript'}{$oitoCincoMeiaB|escape:'javascript'}{$noveQuatroCinco|escape:'javascript'}";
            var fileName = 'ompBlock.mrc'; // Nome do arquivo a ser baixado

            var blob = new Blob([text], { type: 'text/plain' });
            if (window.navigator.msSaveOrOpenBlob) {
                window.navigator.msSaveBlob(blob, fileName);
            } else {
                var elem = window.document.createElement('a');
                elem.href = window.URL.createObjectURL(blob);
                elem.download = fileName;
                document.body.appendChild(elem);
                elem.click();
                document.body.removeChild(elem);
            }
        });
    });
</script>


</div>

{/if}
