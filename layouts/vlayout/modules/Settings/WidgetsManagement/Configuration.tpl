{*/*+***********************************************************************************************************************************
 * The contents of this file are subject to the YetiForce Public License Version 1.1 (the "License"); you may not use this file except
 * in compliance with the License.
 * Software distributed under the License is distributed on an "AS IS" basis, WITHOUT WARRANTY OF ANY KIND, either express or implied.
 * See the License for the specific language governing rights and limitations under the License.
 * The Original Code is YetiForce.
 * The Initial Developer of the Original Code is YetiForce. Portions created by YetiForce are Copyright (C) www.yetiforce.com. 
 * All Rights Reserved.
 *************************************************************************************************************************************/*}
 
<style>
.fieldDetailsForm .zeroOpacity{
display: none;
}
.visibility{
visibility: hidden;
}
.marginLeft20{
margin-left: 20px;
}
.marginRight20{
	margin-right: 20px;
}
.marginTop5{
	margin-top: 5px;
}
.paddingNoTop20{
padding: 20px 20px 20px 20px;
}
</style>
<div class="container-fluid" id="widgetsManagementEditorContainer">
		<input id="selectedModuleName" type="hidden" value="{$SELECTED_MODULE_NAME}" />
		<div class="widget_header row-fluid">
			<div class="span8">
				<h3>{vtranslate('LBL_WIDGETS_MANAGEMENT', $QUALIFIED_MODULE)}</h3>
				{vtranslate('LBL_WIDGETS_MANAGEMENT_DESCRIPTION', $QUALIFIED_MODULE)}
			</div>
			<div class="span4">
				<div class="pull-right">
					<select class="select2 span3" name="widgetsManagementEditorModules">
						{foreach item=mouleName from=$SUPPORTED_MODULES}
							<option value="{$mouleName}" {if $mouleName eq $SELECTED_MODULE_NAME} selected {/if}>{vtranslate($mouleName, $QUALIFIED_MODULE)}</option>
						{/foreach}
				</select>
				</div>
			</div>
		</div>

<div class="contents tabbable">
	
	<div class="tab-content layoutContent paddingNoTop20 themeTableColor overflowVisible">
		
	<div class="tab-pane active" id="layoutDashBoards">
		<div class="btn-toolbar">
			<button type="button" class="btn addBlockDashBoard"><i class="icon-plus"></i>&nbsp;{vtranslate('LBL_ADD_CONDITION', $QUALIFIED_MODULE)}</button>
		</div>
		
		<div id="moduleBlocks">
			<input type="hidden" name="filter_users" value='{Zend_Json::encode($WIDGETS_WITH_FILTER_USERS)}'>
			{foreach key=AUTHORIZATION_KEY item=AUTHORIZATION_INFO from=$DASHBOARD_AUTHORIZATION_BLOCKS}
				{assign var=AUTHORIZATION_NAME value=$AUTHORIZATION_INFO.name}
				<div id="block_{$AUTHORIZATION_KEY}" class="editFieldsTable block_{$AUTHORIZATION_KEY} marginBottom10px border1px blockSortable" data-block-id="{$AUTHORIZATION_KEY}" data-sequence="" data-code="{$AUTHORIZATION_INFO.code}" style="border-radius: 4px 4px 0px 0px;background: white;">
					<div class="row-fluid layoutBlockHeader">
						<div class="blockLabel span5 padding10 ">
							<span class="marginLeft20">
								<strong>{vtranslate($AUTHORIZATION_NAME, $SELECTED_MODULE_NAME)}</strong>
							</span>
						</div>
						<div class="span6 marginLeftZero" style="float:right !important;">
							<span class="padding10 pull-right actions">
								<a href="javascript:void(0)" class="deleteCustomBlock" >
									<i class="icon-trash alignMiddle" title="{vtranslate('LBL_DELETE', $QUALIFIED_MODULE)}"></i>
								</a>
							</span>
							<div class="pull-right btn-toolbar blockActions" style="margin: 4px;">
								<div class="btn-group">
									<button class="btn addCustomField" type="button"><i class="icon-plus"></i>&nbsp;
										<strong>{vtranslate('LBL_ADD_WIDGET', $QUALIFIED_MODULE)}</strong>
									</button>
								</div>
								{if $SELECTED_MODULE_NAME eq 'Home'}
									{assign var=MINILISTWIDGET value=$SPECIAL_WIDGETS['Mini List']}
									<div class="btn-group">
										<button class="btn addMiniList" type="button"  data-url="{$MINILISTWIDGET->getUrl()}" data-linkid="{$MINILISTWIDGET->get('linkid')}" data-name="{$MINILISTWIDGET->getName()}" data-width="{$MINILISTWIDGET->getWidth()}" data-height="{$MINILISTWIDGET->getHeight()}" data-block-id="{$AUTHORIZATION_KEY}"><i class="icon-plus"></i>&nbsp;
											<strong>{vtranslate('LBL_ADD_MINILIST', $QUALIFIED_MODULE)}</strong>
										</button>
									</div>
									{assign var=NOTEBOOKWIDGET value=$SPECIAL_WIDGETS['Notebook']}
									<div class="btn-group">
										<button class="btn addNotebook" type="button" data-url="{$NOTEBOOKWIDGET->getUrl()}" data-linkid="{$NOTEBOOKWIDGET->get('linkid')}" data-name="{$NOTEBOOKWIDGET->getName()}" data-width="{$NOTEBOOKWIDGET->getWidth()}" data-height="{$NOTEBOOKWIDGET->getHeight()}" data-block-id="{$AUTHORIZATION_KEY}"><i class="icon-plus"></i>&nbsp;
											<strong>{vtranslate('LBL_ADD_NOTEBOOK', $QUALIFIED_MODULE)}</strong>
										</button>
									</div>
								{/if}
							</div>
						</div>
						
					</div>
					<div class="blockFieldsList blockFieldsSortable row-fluid" style="padding:5px;min-height: 27px">
						<ul name="sortable1" class="connectedSortable span6" style="list-style-type: none; float: left;min-height: 1px;padding:2px;">
							{assign var=WIDGETS_AUTHORIZATION value=$WIDGETS_AUTHORIZATION_INFO.$AUTHORIZATION_KEY}
							{foreach item=WIDGET_MODEL from=$WIDGETS_AUTHORIZATION name=fieldlist}
								{assign var=WIDGET_INFO value=Zend_Json::decode(html_entity_decode($WIDGET_MODEL->get('data')))}
								{assign var=LINKID value=$WIDGET_MODEL->get('linkid')}
								{if $smarty.foreach.fieldlist.index % 2 eq 0}
									<li>
										<div class="opacity editFieldsWidget marginLeftZero border1px" data-block-id="{$AUTHORIZATION_KEY}" data-field-id="{$WIDGET_MODEL->get('id')}" data-linkid="{$LINKID}" data-sequence="">
											<div class="row-fluid padding1per">
												<div class="span10 " style="word-wrap: break-word;">
													<span class="fieldLabel marginLeft20">{vtranslate($WIDGET_MODEL->getTitle(), $SELECTED_MODULE_NAME)}</span>
												</div>
												<span class="btn-group pull-right marginRight20 actions">
													<a href="javascript:void(0)" class="dropdown-toggle editFieldDetails" data-toggle="dropdown">
														<i class="icon-pencil alignMiddle" title="{vtranslate('LBL_EDIT', $QUALIFIED_MODULE)}"></i>
													</a>
													<div class="basicFieldOperations hide pull-right" style="width : 375px;">
														<form class="form-horizontal fieldDetailsForm" method="POST">
															<div class="modal-header contentsBackground">
																<strong>{vtranslate($WIDGET_MODEL->getTitle(), $SELECTED_MODULE_NAME)}</strong>
																<div class="pull-right"><a href="javascript:void(0)" class='cancel'>X</a></div>
															</div>
															<div class="clearfix">
																<div class="row-fluid" style="padding: 5px; ">
																	<span class="span3" style="text-align:center">
																		<input type="checkbox" name="isdefault" class="" {if $WIDGET_MODEL->get('isdefault') eq 1} checked {/if}>
																	</span>	
																	<label class="span9 marginTop5 pull-left" >
																		&nbsp;{vtranslate('LBL_MANDATORY_WIDGET', $QUALIFIED_MODULE)}&nbsp;
																	</label>
																</div>
																{assign var=WIDGET_SIZE value=Zend_Json::decode(html_entity_decode($WIDGET_MODEL->get('size')))}
																<div class="row-fluid" style="padding: 5px; ">
																	<span class="span3" style="text-align:center">
																		<select class="width span1 pull-left" name="width" >
																			{foreach from=$SIZE.width item=item}
																				<option value="{$item}" {if $WIDGET_SIZE.width eq $item} selected {/if}>{$item}</option>
																			{/foreach}
																		</select>
																	</span>	
																	<label  class="span9 marginTop5 pull-left" >
																		&nbsp;{vtranslate('LBL_WIDTH', $QUALIFIED_MODULE)}&nbsp;
																	</label>
																</div>
																<div class="row-fluid" style="padding: 5px; ">
																	<span class="span3" style="text-align:center">
																		<select class="height span1 pull-left" name="height">
																			{foreach from=$SIZE.height item=item}
																				<option value="{$item}" {if $WIDGET_SIZE.height eq $item} selected {/if}>{$item}</option>
																			{/foreach}
																		</select>
																	</span>
																	<label class="span9 marginTop5 pull-left" >
																		&nbsp;{vtranslate('LBL_HEIGHT', $QUALIFIED_MODULE)}&nbsp;
																	</label>	
																</div>
																{if in_array($WIDGET_MODEL->get('linklabel'), $TITLE_OF_LIMIT) }
																<div class="row-fluid" style="padding: 5px; ">
																	<span class="span3" style="text-align:center">
																		<input type="text" name="limit" class="span1" value="{$WIDGET_MODEL->get('limit')}" >
																	</span>
																	<label class="span9 marginTop5 pull-left" >
																		&nbsp;{vtranslate('LBL_NUMBER_OF_RECORDS_DISPLAYED', $QUALIFIED_MODULE)}&nbsp;
																	</label>
																</div>
																{/if}
															</div>
															{if in_array($WIDGET_MODEL->get('linklabel'),$WIDGETS_WITH_FILTER_USERS)}
																<div class="row-fluid " style="padding: 0px; border-top:1px solid #dddddd ">
																	{assign var=WIDGET_OWNERS value=Zend_Json::decode(html_entity_decode($WIDGET_MODEL->get('owners')))}
																	<div class="row-fluid" style="padding: 5px; ">
																		<span class="span5">
																			<select class="widgetFilter span2" id="owner" name="default_owner">
																				{foreach key=OWNER_NAME item=OWNER_ID from=$FILTER_SELECT_DEFAULT}
																					<option value="{$OWNER_ID}" {if $WIDGET_OWNERS.default eq $OWNER_ID} selected {/if} >{vtranslate($OWNER_NAME, $QUALIFIED_MODULE)}</option>
																				{/foreach}
																			</select>
																		</span>
																		<label class="span7 marginTop5 pull-left" >
																			&nbsp;{vtranslate('LBL_DEFAULT_FILTER', $QUALIFIED_MODULE)}&nbsp;
																		</label>
																	</div>	
																	{if !is_array($WIDGET_OWNERS.available)}
																		{$WIDGET_OWNERS.available = array($WIDGET_OWNERS.available)}
																	{/if}
																	<div class="row-fluid" style="padding: 5px; ">
																		<span class="span8">
																			<select class="widgetFilter span3" multiple="true" name="owners_all" placeholder="{vtranslate('LBL_PLEASE_SELECT_ATLEAST_ONE_OPTION', $QUALIFIED_MODULE)}">
																				{foreach key=OWNER_NAME item=OWNER_ID from=$FILTER_SELECT}
																					<option value="{$OWNER_ID}" {if in_array($OWNER_ID, $WIDGET_OWNERS.available)} selected {/if} >{vtranslate($OWNER_NAME, $QUALIFIED_MODULE)}</option>
																				{/foreach}
																			</select>
																		</span>
																		<label class="span4 marginTop5 pull-left" >
																			&nbsp;{vtranslate('LBL_FILTERS_AVAILABLE', $QUALIFIED_MODULE)}&nbsp;
																		</label>
																	</div>	
																</div>
															{/if}
															<div class="modal-footer" style="padding: 0px;">
																<span class="pull-right">
																	<div class="pull-right"><a href="javascript:void(0)" style="margin: 5px;color:#AA3434;margin-top:10px;" class='cancel'>{vtranslate('LBL_CANCEL', $QUALIFIED_MODULE)}</a></div>
																	<button class="btn btn-success saveFieldDetails" data-field-id="{$WIDGET_MODEL->get('id')}" type="submit" style="margin: 5px;">
																		<strong>{vtranslate('LBL_SAVE', $QUALIFIED_MODULE)}</strong>
																	</button>
																</span>
															</div>
														</form>
													</div>
													<a href="javascript:void(0)" class="deleteCustomField" data-field-id="{$WIDGET_MODEL->get('id')}">
														<i class="icon-trash alignMiddle" title="{vtranslate('LBL_DELETE', $QUALIFIED_MODULE)}"></i>
													</a>
												</span>
											</div>
										</div>
									</li>
								{/if}
							{/foreach}
						</ul>
						<ul name="sortable2" class="connectedSortable span6" style="list-style-type: none; margin: 0; float: left;min-height: 1px;padding:2px;">
							{foreach item=WIDGET_MODEL from=$WIDGETS_AUTHORIZATION name=fieldlist1}
								{assign var=WIDGET_INFO value=Zend_Json::decode(html_entity_decode($WIDGET_MODEL->get('data')))}
								{assign var=LINKID value=$WIDGET_MODEL->get('linkid')}
								{if $smarty.foreach.fieldlist1.index % 2 neq 0}
									<li>
										<div class="opacity editFieldsWidget marginLeftZero border1px" data-block-id="{$AUTHORIZATION_KEY}" data-field-id="{$WIDGET_MODEL->get('id')}" data-linkid="{$LINKID}" data-sequence="">
											<div class="row-fluid padding1per">
												<div class="span10 " style="">
													<span class="fieldLabel marginLeft20">{vtranslate($WIDGET_MODEL->getTitle(), $SELECTED_MODULE_NAME)}</span>
													
												</div>
												<span class="btn-group pull-right marginRight20 actions">
													<a href="javascript:void(0)" class="dropdown-toggle editFieldDetails" data-toggle="dropdown">
														<i class="icon-pencil alignMiddle" title="{vtranslate('LBL_EDIT', $QUALIFIED_MODULE)}"></i>
													</a>
													<div class="basicFieldOperations hide pull-right" style="width: 375px;">
														<form class="form-horizontal fieldDetailsForm" method="POST">
															<div class="modal-header contentsBackground">
																<strong>{vtranslate($WIDGET_MODEL->getTitle(), $SELECTED_MODULE_NAME)}</strong>
																<div class="pull-right"><a href="javascript:void(0)" class='cancel'>X</a></div>
															</div>
															<div class="clearfix">
																<div class="row-fluid" style="padding: 5px; ">
																	<span class="span3" style="text-align:center">
																		<input type="checkbox" name="isdefault" class="" {if $WIDGET_MODEL->get('isdefault') eq 1} checked {/if}>
																	</span>	
																	<label class="span9 marginTop5 pull-left" >
																		&nbsp;{vtranslate('LBL_MANDATORY_WIDGET', $QUALIFIED_MODULE)}&nbsp;
																	</label>
																</div>
																{assign var=WIDGET_SIZE value=Zend_Json::decode(html_entity_decode($WIDGET_MODEL->get('size')))}
																<div class="row-fluid" style="padding: 5px; ">
																	<span class="span3" style="text-align:center">
																		<select class="width span1 pull-left" name="width" >
																			{foreach from=$SIZE.width item=item}
																				<option value="{$item}" {if $WIDGET_SIZE.width eq $item} selected {/if}>{$item}</option>
																			{/foreach}
																		</select>
																	</span>	
																	<label  class="span9 marginTop5 pull-left" >
																		&nbsp;{vtranslate('LBL_WIDTH', $QUALIFIED_MODULE)}&nbsp;
																	</label>
																</div>
																<div class="row-fluid" style="padding: 5px; ">
																	<span class="span3" style="text-align:center">
																		<select class="height span1 pull-left" name="height">
																			{foreach from=$SIZE.height item=item}
																				<option value="{$item}" {if $WIDGET_SIZE.height eq $item} selected {/if}>{$item}</option>
																			{/foreach}
																		</select>
																	</span>
																	<label class="span9 marginTop5 pull-left" >
																		&nbsp;{vtranslate('LBL_HEIGHT', $QUALIFIED_MODULE)}&nbsp;
																	</label>	
																</div>
																{if in_array($WIDGET_MODEL->get('linklabel'), $TITLE_OF_LIMIT) }
																<div class="row-fluid" style="padding: 5px; ">
																	<span class="span3" style="text-align:center">
																		<input type="text" name="limit" class="span1" value="{$WIDGET_MODEL->get('limit')}" >
																	</span>
																	<label class="span9 marginTop5 pull-left" >
																		&nbsp;{vtranslate('LBL_NUMBER_OF_RECORDS_DISPLAYED', $QUALIFIED_MODULE)}&nbsp;
																	</label>
																</div>
																{/if}
															</div>
															{if in_array($WIDGET_MODEL->get('linklabel'),$WIDGETS_WITH_FILTER_USERS)}
																<div class="row-fluid " style="padding: 0px; border-top:1px solid #dddddd ">
																	{assign var=WIDGET_OWNERS value=Zend_Json::decode(html_entity_decode($WIDGET_MODEL->get('owners')))}
																	<div class="row-fluid" style="padding: 5px; ">
																		<span class="span5">
																			<select class="widgetFilter span2" id="owner" name="default_owner">
																				{foreach key=OWNER_NAME item=OWNER_ID from=$FILTER_SELECT_DEFAULT}
																					<option value="{$OWNER_ID}" {if $WIDGET_OWNERS.default eq $OWNER_ID} selected {/if} >{vtranslate($OWNER_NAME, $QUALIFIED_MODULE)}</option>
																				{/foreach}
																			</select>
																		</span>
																		<label class="span7 marginTop5 pull-left" >
																			&nbsp;{vtranslate('LBL_DEFAULT_FILTER', $QUALIFIED_MODULE)}&nbsp;
																		</label>
																	</div>	
																	{if !is_array($WIDGET_OWNERS.available)}
																		{$WIDGET_OWNERS.available = array($WIDGET_OWNERS.available)}
																	{/if}
																	<div class="row-fluid" style="padding: 5px; ">
																		<span class="span8">
																			<select class="widgetFilter span3" multiple="true" name="owners_all" placeholder="{vtranslate('LBL_PLEASE_SELECT_ATLEAST_ONE_OPTION', $QUALIFIED_MODULE)}">
																				{foreach key=OWNER_NAME item=OWNER_ID from=$FILTER_SELECT}
																					<option value="{$OWNER_ID}" {if in_array($OWNER_ID, $WIDGET_OWNERS.available)} selected {/if} >{vtranslate($OWNER_NAME, $QUALIFIED_MODULE)}</option>
																				{/foreach}
																			</select>
																		</span>
																		<label class="span4 marginTop5 pull-left" >
																			&nbsp;{vtranslate('LBL_FILTERS_AVAILABLE', $QUALIFIED_MODULE)}&nbsp;
																		</label>
																	</div>	
																</div>
															{/if}
															<div class="modal-footer" style="padding: 0px;">
																<span class="pull-right">
																	<div class="pull-right"><a href="javascript:void(0)" style="margin: 5px;color:#AA3434;margin-top:10px;" class='cancel'>{vtranslate('LBL_CANCEL', $QUALIFIED_MODULE)}</a></div>
																	<button class="btn btn-success saveFieldDetails" data-field-id="{$WIDGET_MODEL->get('id')}" type="submit" style="margin: 5px;">
																		<strong>{vtranslate('LBL_SAVE', $QUALIFIED_MODULE)}</strong>
																	</button>
																</span>
															</div>
														</form>
													</div>
													<a href="javascript:void(0)" class="deleteCustomField" data-field-id="{$WIDGET_MODEL->get('id')}">
														<i class="icon-trash alignMiddle" title="{vtranslate('LBL_DELETE', $QUALIFIED_MODULE)}"></i>
													</a>
												</span>
											</div>
										</div>
									</li>
								{/if}
							{/foreach}
						</ul>
					</div>
				</div>
			{/foreach}
		</div>
{* copy elements hide *}		
		<div class="modal addBlockDashBoardModal hide">
			<div class="modal-header contentsBackground">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h3>{vtranslate('LBL_ADD_DASHBOARD_BLOCK', $QUALIFIED_MODULE)}</h3>
			</div>
			<form class="form-horizontal addBlockDashBoardForm">
				<div class="modal-body">
					<div class="control-group">
						<span class="control-label">
							<span>{vtranslate('LBL_CHOISE_AUTHORIZED', $QUALIFIED_MODULE)}</span>
							<span class="redColor">*</span>
						</span>
						<div class="controls">
							<select class="authorized span3" name="authorized" style="margin-bottom:0px;" >
								{foreach from=$ALL_AUTHORIZATION item=AUTHORIZED key=AUTHORIZED_CODE}
									<option value="{$AUTHORIZED_CODE}" data-label="{$AUTHORIZED->get('rolename')}">{vtranslate($AUTHORIZED->get('rolename'),$QUALIFIED_MODULE)}</option>
								{/foreach}
							</select>
						</div>
					</div>
				</div>
				{include file='ModalFooter.tpl'|@vtemplate_path:'Vtiger'}
			</form>
		</div>
		
		<div class="newCustomBlockCopy hide marginBottom10px border1px blockSortable " data-block-id="" data-sequence="" style="border-radius: 4px 4px 0px 0px;background: white">
			<div class="row-fluid layoutBlockHeader">
				<div class="blockLabel span5 padding10 ">
					<span class="marginLeft20">

					</span>
				</div>
				<div class="span6 marginLeftZero" style="float:right !important;">
					<span class="padding10 pull-right actions">
						<a href="javascript:void(0)" class="deleteCustomBlock" >
							<i class="icon-trash alignMiddle" title="{vtranslate('LBL_DELETE', $QUALIFIED_MODULE)}"></i>
						</a>
					</span>
					<div class="pull-right btn-toolbar blockActions" style="margin: 4px;">
						<div class="btn-group">
							<button class="btn addCustomField hide" type="button"><i class="icon-plus"></i>&nbsp;
								<strong>{vtranslate('LBL_ADD_WIDGET', $QUALIFIED_MODULE)}</strong>
							</button>
						</div>
						{if $SELECTED_MODULE_NAME eq 'Home'}
							{assign var=MINILISTWIDGET value=$SPECIAL_WIDGETS['Mini List']}
							<div class="btn-group">
								<button class="btn addMiniList specialWidget" type="button"  data-url="{$MINILISTWIDGET->getUrl()}" data-linkid="{$MINILISTWIDGET->get('linkid')}" data-name="{$MINILISTWIDGET->getName()}" data-width="{$MINILISTWIDGET->getWidth()}" data-height="{$MINILISTWIDGET->getHeight()}" data-block-id=""><i class="icon-plus"></i>&nbsp;
									<strong>{vtranslate('LBL_ADD_MINILIST', $QUALIFIED_MODULE)}</strong>
								</button>
							</div>
							{assign var=NOTEBOOKWIDGET value=$SPECIAL_WIDGETS['Notebook']}
							<div class="btn-group">
								<button class="btn addNotebook specialWidget" type="button" data-url="{$NOTEBOOKWIDGET->getUrl()}" data-linkid="{$NOTEBOOKWIDGET->get('linkid')}" data-name="{$NOTEBOOKWIDGET->getName()}" data-width="{$NOTEBOOKWIDGET->getWidth()}" data-height="{$NOTEBOOKWIDGET->getHeight()}" data-block-id=""><i class="icon-plus"></i>&nbsp;
									<strong>{vtranslate('LBL_ADD_NOTEBOOK', $QUALIFIED_MODULE)}</strong>
								</button>
							</div>
						{/if}
					</div>
				</div>
			</div>
			<div class="blockFieldsList row-fluid blockFieldsSortable" style="padding:5px;min-height: 27px">
				<ul class="connectedSortable span6 ui-sortable" style="list-style-type: none; float: left;min-height:1px;padding:2px;" name="sortable1"></ul>
				<ul class="connectedSortable span6 ui-sortable" style="list-style-type: none; margin: 0;float: left;min-height:1px;padding:2px;" name="sortable2"></ul>
			</div>
		</div>
		
		<div class="modal createFieldModal hide">
			<div class="modal-header contentsBackground">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h3>{vtranslate('LBL_CREATE_CUSTOM_FIELD', $QUALIFIED_MODULE)}</h3>
			</div>
			<form class="form-horizontal createCustomFieldForm"  method="POST">
				<div class="modal-body">
					<div class="control-group">
						<span class="control-label">
							{vtranslate('LBL_SELECT_WIDGET', $QUALIFIED_MODULE)}
						</span>
						<div class="controls">
							<span class="row-fluid">
								<select class="widgets span9" name="widgets" data-validation-engine="validate[required]"  >
									{foreach from=$WIDGETS item=WIDGET}
										{if $WIDGET->getTitle() eq 'Mini List' || $WIDGET->getTitle() eq 'Notebook'}
											{continue}
										{/if}
										<option value="{$WIDGET->get('linkid')}" data-name="{$WIDGET->get('linklabel')}">{vtranslate($WIDGET->getTitle(), $MODULE_NAME)}</option>
									{/foreach}
								</select>
							</span>
						</div>
					</div>
					<div class="control-group">
						<span class="control-label">
							{vtranslate('LBL_WIDTH', $QUALIFIED_MODULE)}
						</span>
						
						<select class="width span1 pull-left" name="width" style="margin-left: 10px;" >
							{foreach from=$SIZE.width item=item}
								<option value="{$item}" {if $DEFAULTVALUES.width eq $item} selected {/if}>{$item}</option>
							{/foreach}
						</select>
						
						<span class="control-label" style="width:135px">
							{vtranslate('LBL_HEIGHT', $QUALIFIED_MODULE)}
						</span>	
						
						<select class="height span1 pull-left" name="height"  >
							{foreach from=$SIZE.height item=item}
								<option value="{$item}" {if $DEFAULTVALUES.height eq $item} selected {/if}>{$item}</option>
							{/foreach}
						</select>
					</div>
					<div class="control-group">
						<span class="control-label">
							{vtranslate('LBL_MANDATORY_WIDGET', $QUALIFIED_MODULE)}
						</span>
						<div class="controls">
							<input type="checkbox" name="isdefault" >
						</div>
					</div>
					<div class="control-group widgetFilter hide">
						<span class="control-label">
							{vtranslate('LBL_DEFAULT_FILTER', $QUALIFIED_MODULE)}
						</span>
						<div class="controls">
							<span class="row-fluid">
								<select class="span4" id="owner" disabled name="default_owner">
									{foreach key=OWNER_NAME item=OWNER_ID from=$FILTER_SELECT_DEFAULT}
										<option value="{$OWNER_ID}">{vtranslate($OWNER_NAME, $QUALIFIED_MODULE)}</option>
									{/foreach}
								</select>
							</span>
						</div>	
					</div>	
					<div class="control-group widgetFilter hide">
						<span class="control-label">
							{vtranslate('LBL_FILTERS_AVAILABLE', $QUALIFIED_MODULE)}
						</span>
						<div class="controls">
							<span class="row-fluid">
								<select class="span9 owners_all" multiple="true" disabled name="owners_all" placeholder="{vtranslate('LBL_PLEASE_SELECT_ATLEAST_ONE_OPTION', $QUALIFIED_MODULE)}">
									{foreach key=OWNER_NAME item=OWNER_ID from=$FILTER_SELECT}
										<option value="{$OWNER_ID}" selected>{vtranslate($OWNER_NAME, $QUALIFIED_MODULE)}</option>
									{/foreach}
								</select>
							</span>
						</div>	
					</div>
				</div>
				{include file='ModalFooter.tpl'|@vtemplate_path:'Vtiger'}
			</form>
		</div>
		
		<li class="newCustomFieldCopy hide">
			<div class="marginLeftZero border1px" data-field-id="" data-linkid="" data-sequence="">
				<div class="row-fluid padding1per">
					<div class="span10 " style="word-wrap: break-word;">
						<span class="fieldLabel marginLeft20"></span>
					</div>
					<span class="btn-group pull-right marginRight20 actions">
						<a href="javascript:void(0)" class="dropdown-toggle editFieldDetails" data-toggle="dropdown">
							<i class="icon-pencil alignMiddle" title="{vtranslate('LBL_EDIT', $QUALIFIED_MODULE)}"></i>
						</a>
						<div class="basicFieldOperations hide pull-right" style="width: 375px;">
							<form class="form-horizontal fieldDetailsForm" method="POST">
								<div class="modal-header contentsBackground">
								</div>
								<div class="clearfix">
									<div class="row-fluid" style="padding: 5px; ">
										<span class="span3" style="text-align:center">
											<input type="checkbox" name="isdefault" >
										</span>	
										<label class="span9 marginTop5 pull-left" >
											&nbsp;{vtranslate('LBL_MANDATORY_WIDGET', $QUALIFIED_MODULE)}&nbsp;
										</label>
									</div>
									<div class="row-fluid" style="padding: 5px; ">
										<span class="span3" style="text-align:center">
											<select class="width span1 pull-left" name="width" >
												{foreach from=$SIZE.width item=item}
													<option value="{$item}">{$item}</option>
												{/foreach}
											</select>
										</span>	
										<label  class="span9 marginTop5 pull-left" >
											&nbsp;{vtranslate('LBL_WIDTH', $QUALIFIED_MODULE)}&nbsp;
										</label>
									</div>
									<div class="row-fluid" style="padding: 5px; ">
										<span class="span3" style="text-align:center">
											<select class="height span1 pull-left" name="height">
												{foreach from=$SIZE.height item=item}
													<option value="{$item}" >{$item}</option>
												{/foreach}
											</select>
										</span>
										<label class="span9 marginTop5 pull-left" >
											&nbsp;{vtranslate('LBL_HEIGHT', $QUALIFIED_MODULE)}&nbsp;
										</label>	
									</div>
									<div class="row-fluid" style="padding: 5px; ">
										<span class="span3" style="text-align:center">
											<input type="text" name="limit" class="span1" value="10" >
										</span>
										<label class="span9 marginTop5 pull-left" >
											&nbsp;{vtranslate('LBL_NUMBER_OF_RECORDS_DISPLAYED', $QUALIFIED_MODULE)}&nbsp;
										</label>
									</div>
								</div>
								<div class="row-fluid widgetFilterAll hide" style="padding: 0px; border-top:1px solid #dddddd ">
									<div class="row-fluid" style="padding: 5px; ">
										<span class="span5">
											<select class="widgetFilter span2" id="owner" name="default_owner">
												{foreach key=OWNER_NAME item=OWNER_ID from=$FILTER_SELECT_DEFAULT}
													<option value="{$OWNER_ID}">{vtranslate($OWNER_NAME, $QUALIFIED_MODULE)}</option>
												{/foreach}
											</select>
										</span>
										<label class="span7 marginTop5 pull-left" >
											&nbsp;{vtranslate('LBL_DEFAULT_FILTER', $QUALIFIED_MODULE)}&nbsp;
										</label>
									</div>	
									<div class="row-fluid" style="padding: 5px; ">
										<span class="span8">
											<select class="widgetFilter span3" multiple="true" name="owners_all" placeholder="{vtranslate('LBL_PLEASE_SELECT_ATLEAST_ONE_OPTION', $QUALIFIED_MODULE)}">
												{foreach key=OWNER_NAME item=OWNER_ID from=$FILTER_SELECT}
													<option value="{$OWNER_ID}" selected>{vtranslate($OWNER_NAME, $QUALIFIED_MODULE)}</option>
												{/foreach}
											</select>
										</span>
										<label class="span4 marginTop5 pull-left" >
											&nbsp;{vtranslate('LBL_FILTERS_AVAILABLE', $QUALIFIED_MODULE)}&nbsp;
										</label>
									</div>	
								</div>
								<div class="modal-footer">
									<span class="pull-right">
										<div class="pull-right"><a href="javascript:void(0)" style="margin-top: 5px;margin-left: 10px;color:#AA3434;" class='cancel'>{vtranslate('LBL_CANCEL', $QUALIFIED_MODULE)}</a></div>
										<button class="btn btn-success saveFieldDetails" data-field-id="" type="submit"><strong>{vtranslate('LBL_SAVE', $QUALIFIED_MODULE)}</strong></button>
									</span>
								</div>
							</form>
						</div>
						<a href="javascript:void(0)" class="deleteCustomField" data-field-id=""><i class="icon-trash alignMiddle" title="{vtranslate('LBL_DELETE', $QUALIFIED_MODULE)}"></i></a>
					</span>
				</div>
			</div>
		</li>
	</div>
</div>
</div>

