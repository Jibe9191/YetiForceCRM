{*<!--
/*+***********************************************************************************************************************************
 * The contents of this file are subject to the YetiForce Public License Version 1.1 (the "License"); you may not use this file except
 * in compliance with the License.
 * Software distributed under the License is distributed on an "AS IS" basis, WITHOUT WARRANTY OF ANY KIND, either express or implied.
 * See the License for the specific language governing rights and limitations under the License.
 * The Original Code is YetiForce.
 * The Initial Developer of the Original Code is YetiForce. Portions created by YetiForce are Copyright (C) www.yetiforce.com. 
 * All Rights Reserved.
 *************************************************************************************************************************************/
-->*}
<table class="table table-bordered table-condensed listViewEntriesTable">
    <thead>
        <tr class="listViewHeaders" >
            <th width="30%">{vtranslate('LBL_MODULE_NAME',$MODULE_NAME)}</th>
            <th>{vtranslate('LBL_SUMMARY',$MODULE_NAME)}</th>
            <th colspan="2"></th>
        </tr>
    </thead>
    {if !empty($DOC_TPL_LIST)}

        <tbody>
            {foreach from=$DOC_TPL_LIST item=item key=key}
                <tr class="listViewEntries" data-id="{$item.id}">
                    <td onclick="location.href = jQuery(this).data('url')" data-url="index.php?module={$MODULE_NAME}&parent=Settings&view=Edit&tpl_id={$item.id}">{vtranslate($item.module, $item.module)}</td>
                    <td onclick="location.href = jQuery(this).data('url')" data-url="index.php?module={$MODULE_NAME}&parent=Settings&view=Edit&tpl_id={$item.id}">{$item.summary}</td>
                    <td><a class="pull-right edit_tpl"><!--<i title="{vtranslate('LBL_EDIT')}" class="icon-pencil alignMiddle"></i>--></a>
                        <a href='index.php?module={$MODULE_NAME}&parent=Settings&action=DeleteTemplate&tpl_id={$item.id}' class="pull-right marginRight10px">
                            <i type="{vtranslate('REMOVE_TPL', $MODULE_NAME)}" class="icon-trash alignMiddle"></i></a>
                    </td>
                <tr>
                {/foreach}
        </tbody>
    </table>
{else}
    <table class="emptyRecordsDiv">
        <tbody>
            <tr>
                <td>
                    {vtranslate('LBL_NO_PROJECT_TPL_ADDED',$MODULE_NAME)}
                </td>
            </tr>
        </tbody>
    </table>
{/if}