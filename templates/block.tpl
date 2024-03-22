{**
 * plugins/blocks/ompMarcBlock/templates/block.tpl
 *}
<div class="pkp_block block_developed_by">
	<h2>
		ompMarcBlock
	</h2>
	<hr>
	
{assign var="authors" value=$publication->getData('authors')}

{* Verifica se existem autores *}
{if $authors|@count > 0}

    {* Obtém o primeiro autor *}
    {assign var="firstAuthor" value=$authors[0]}

    {* Obtém nome e sobrenome do primeiro autor *}
    {assign var="authorName" value=$firstAuthor->getFullName()|escape}

    {* Obtém o ORCID do primeiro autor, se disponível *}
    {assign var="orcid" value=$firstAuthor->getOrcid()|default:'OrCiD'}

    {* Obtém a afiliação do primeiro autor, se disponível *}
    {assign var="affiliation" value=$firstAuthor->getLocalizedAffiliation()|default:'aFiLiAçÃo'}

    {* Formata a informação do primeiro autor *}
    

{/if}

	<hr>
	<b>005=</b>data<br>
	<b>008=</b><u>^^^^^^s2023^^^^bl^^^^^^^^^^^^000^0^por^d</u><br>
	<b>020=</b>\\$aISBN<br>
	<b>024=</b>7\$aDOI$2DOI<br>
	<b>040=</b><u>\\$aUSP/ABCD</u><br>
	<b>041=</b><u>0\$apor</u><br>
	<b>044=</b><u>\\$abl</u><br>
	<b>100=</b>1\$a'{$authorName}, {$orcid}, {$affiliation}'<br>	<b>245=</b>12$a{$publication->getLocalizedFullTitle()|escape}$h[recurso eletrônico]<br>
	<b>260=</b>\\$aLocal, $b{$publication->getLocalizedData('copyrightHolder')}$c{$publication->getData('copyrightYear')}<br>
	<b>490=</b>$a{$series->getLocalizedFullTitle()} $v{$publication->getData('seriesPosition')}<br>
	<b>500=</b>\\$aDisponível em: {$smarty.server.HTTP_HOST}{$smarty.server.REQUEST_URI}. Acesso em: dd.mm.yyyy<br>
	<b>700=</b>Demais autores<br>
	<b>856=</b>4\$zClicar sobre o botão para acesso ao texto completo$u Link DOI $3DOI<br>
	<b>856=</b>41$zClicar sobre o botão para acesso ao texto completo$u Link PDF $3Portal de Livros Abertos da USP<br>
	<b>945=</b><u>\\$aP$bMONOGRAFIA/LIVRO$c06$j2023$lNACIONAL</u><br>
<hr>

</div>
