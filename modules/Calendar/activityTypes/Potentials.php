<?php
/*+***********************************************************************************************************************************
 * The contents of this file are subject to the YetiForce Public License Version 1.1 (the "License"); you may not use this file except
 * in compliance with the License.
 * Software distributed under the License is distributed on an "AS IS" basis, WITHOUT WARRANTY OF ANY KIND, either express or implied.
 * See the License for the specific language governing rights and limitations under the License.
 * The Original Code is YetiForce.
 * The Initial Developer of the Original Code is YetiForce. Portions created by YetiForce are Copyright (C) www.yetiforce.com. 
 * All Rights Reserved.
 *************************************************************************************************************************************/
class Calendar_Potentials_ActivityTypes{
	public function process($feed, $request, $start, $end, &$result, $userid = false,$color = null,$textColor = 'white') {
		$query = "SELECT potentialname,closingdate FROM Potentials";
		$query.= " WHERE closingdate >= '$start' AND closingdate <= '$end'";
		$records = $feed->queryForRecords($query);
		foreach ($records as $record) {
			$item = array();
			list ($modid, $crmid) = vtws_getIdComponents($record['id']);
			$item['id'] = $crmid;
			$item['title'] = decode_html($record['potentialname']);
			$item['start'] = $record['closingdate'];
			$item['url']   = sprintf('index.php?module=Potentials&view=Detail&record=%s', $crmid);
			$item['color'] = $color;
			$item['textColor'] = $textColor;
			$result[] = $item;
		}
	}
}