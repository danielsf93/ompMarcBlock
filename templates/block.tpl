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
        
{* Obter Primeiro Autor *}
        {assign var="authors" value=$publication->getData('authors')}
        {if $authors|@count > 0}
            {assign var="firstAuthor" value=$authors[0]}
            {assign var="authorName" value=$firstAuthor->getFullName()|escape}
            {assign var="orcid" value=$firstAuthor->getOrcid()|default:'OrCiD'}
            {assign var="affiliation" value=$firstAuthor->getLocalizedAffiliation()|default:'aFiLiAçÃo'}
        {/if}



{* Organizando a Informação *}

    {assign var="zeroZeroCinco" value="<b>005=</b>data<br>"}

    {assign var="zeroZeroOito" value="<b>008=</b><u>^^^^^^s2023^^^^bl^^^^^^^^^^^^000^0^por^d</u><br>"}

    {assign var="zeroDoisZero" value="<b> 020=</b>\\\\$a{if $isbn|trim}{$isbn}{else}iSbN{/if}"}
        
    {assign var="zeroDoisQuatro" value="<b>024=</b>7\$a{$publication->getStoredPubId('doi')|escape}$2DOI<br>"}

    {assign var="zeroQuatroZero" value="<b>040=</b><u>\\$aUSP/ABCD</u><br>"}

    {assign var="zeroQuatroUm" value="<b>041=</b><u>0\$apor</u><br>"}

    {assign var="zeroQuatroQuatro" value="<b>044=</b><u>\$abl</u><br>"}

    {assign var="umZeroZero" value="<b>100=</b>1\$a'{$authorName}, {$orcid}, {$affiliation}'<br>"}

    {assign var="doisQuatroCinco" value="<b>245=</b>12$a{$publication->getLocalizedFullTitle()|escape}$h[recurso eletrônico]<br>"}

    {assign var="doisMeiaZero" value="<b>260=</b>\$aLocal, $b{$publication->getLocalizedData('copyrightHolder')}$c{$publication->getData('copyrightYear')}<br>"}

    {assign var="quatroNoveZero" value="{if $series}<b>490=</b>$a{$series->getLocalizedFullTitle()} $v{$publication->getData('seriesPosition')}<br>{/if}"}

    {assign var="cincoZeroZero" value="<b>500=</b>\$aDisponível em: {$smarty.server.HTTP_HOST}{$smarty.server.REQUEST_URI}. Acesso em: {$smarty.now|date_format:"%d.%m.%Y"}<br>"}

    {assign var="oitoCincoMeiaA" value="<b>856=</b>4\$zClicar sobre o botão para acesso ao texto completo$u{$publication->getStoredPubId('doi')|escape}$3DOI<br>"}

    {assign var="oitoCincoMeiaB" value="<b>856=</b>41$zClicar sobre o botão para acesso ao texto completo$u Link PDF $3Portal de Livros Abertos da USP<br>"}

    {assign var="noveQuatroCinco" value="<b>945=</b><u> +aP +bMONOGRAFIA/LIVRO$c06$j2023$lNACIONAL</u><br>"}
    
 
{* Chamando a informação*}
        
        {$zeroZeroCinco}
        {$zeroZeroOito}
        {$zeroDoisZero}
        {$zeroDoisQuatro}
        {$zeroQuatroZero}
        {$zeroQuatroUm}
        {$zeroQuatroQuatro}
        {$umZeroZero}
        {$doisQuatroCinco}
        {$doisMeiaZero}
        
        {$quatroNoveZero}
        
        {$cincoZeroZero}
        {$oitoCincoMeiaA}
        {$oitoCincoMeiaB}
        {$noveQuatroCinco}

<hr>

  
    <button id="downloadButton" class="botao">Baixar Arquivo MARC</button>


<script>
    document.addEventListener('DOMContentLoaded', function() {
        var downloadButton = document.getElementById('downloadButton');
        downloadButton.addEventListener('click', function() {
var text = "{$umZeroZero|escape:'javascript'}, {$doisQuatroCinco|escape:'javascript'}, {$cincoZeroZero|escape:'javascript'}";
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
