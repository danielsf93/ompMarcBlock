{if isset($publication)}
    <div class="pkp_block block_ompmarckblock">
        <h2>
            ompMarcBlock
        </h2>
        {$filomena}<br>
        TESTES AQUI:<br>
       inicio

<b>

{$publication->getData('pub-id::publisher-id')}




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

    {assign var="zeroDoisZero" value="  a{if $isbn|trim}{$isbn}{else}iSbN{/if}7 "}
        
    {assign var="zeroDoisQuatro" value="a{$publication->getStoredPubId('doi')|escape}2DOI"}

    {assign var="zeroQuatroZero" value="  aUSP/ABCD0 "}

    {assign var="zeroQuatroUm" value="apor  "}

    {assign var="zeroQuatroQuatro" value="abl1 "}





{* Obter Primeiro Autor *}
     {* Obter Primeiro Autor *}
{assign var="authors" value=$publication->getData('authors')}
{if $authors|@count > 0}
    {assign var="firstAuthor" value=$authors[0]}
    {assign var="givenName" value=$firstAuthor->getLocalizedGivenName()|escape}
    {assign var="surname" value=$firstAuthor->getLocalizedFamilyName()|escape}
    {assign var="orcid" value=$firstAuthor->getOrcid()|default:'OrCiD'}
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

    {assign var="doisMeiaZero" value="a LOCALb{$publication->getLocalizedData('copyrightHolder')}c{$publication->getData('copyrightYear')}0 "}

    {assign var="quatroNoveZero" value="{if $series}a {$series->getLocalizedFullTitle()}v {$publication->getData('seriesPosition')}{/if}  "}

    {assign var="cincoZeroZero" value="aDisponível em: http://{$smarty.server.HTTP_HOST}{$smarty.server.REQUEST_URI}. Acesso em: {$smarty.now|date_format:"%d.%m.%Y"}"}

    {assign var="oitoCincoMeiaA" value="4 zClicar sobre o botão para acesso ao texto completouhttps://doi.org/{$publication->getStoredPubId('doi')|escape}3DOI"}

    {assign var="oitoCincoMeiaB" value="41zClicar sobre o botão para acesso ao texto completouLINK PDF3Portal de Livros Abertos da USP  "}

    {assign var="noveQuatroCinco" value="aPbMONOGRAFIA/LIVROc06j2023lNACIONAL"}
    
 
{* Chamando a informação*}
        
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
        <b>856=</b>{$oitoCincoMeiaA}<br>
        <b>856=</b>{$oitoCincoMeiaB}<br>
        <b>945=</b>{$noveQuatroCinco}<br>

<hr>

  
    <button id="downloadButton" class="botao">Baixar Arquivo MARC</button>


<script>
    document.addEventListener('DOMContentLoaded', function() {
        var downloadButton = document.getElementById('downloadButton');
        downloadButton.addEventListener('click', function() {
var text = "{$zeroZeroCinco|escape:'javascript'}{$zeroZeroOito|escape:'javascript'}{$zeroDoisZero|escape:'javascript'}{$zeroDoisQuatro|escape:'javascript'}{$zeroQuatroZero|escape:'javascript'}{$zeroQuatroUm|escape:'javascript'}{$zeroQuatroQuatro|escape:'javascript'}{$umZeroZero|escape:'javascript'}{$doisQuatroCinco|escape:'javascript'}{$doisMeiaZero|escape:'javascript'}{$quatroNoveZero|escape:'javascript'}{$cincoZeroZero|escape:'javascript'}{$oitoCincoMeiaA|escape:'javascript'}{$oitoCincoMeiaB|escape:'javascript'}{$noveQuatroCinco|escape:'javascript'}";
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
