<?php
$errors = validation_errors();
if($errors){
	echo $this->msg->err('<ul>' . $errors . '</ul>', 'Please check the following invalid item(s) and try again.');
}
?>

<p>Listed below are the groups that exist within Classroombookings. In each tab, it is possible to configure what users belonging to that group are allowed and not allowed to do.</p>

<div class="tabber" id="tabs-permissions">

	<?php
	foreach($groups as $group_id => $group_name){
		echo '<div class="tabbertab' . (("$tab" == "$group_id") ? ' tabbertabdefault' : '') . '">';
		echo '<h2>' . $group_name . '</h2>';
		echo form_open('security/permissions/save', NULL, array('group_id' => $group_id));
	?>
			
		<table class="form a-t" cellpadding="0" cellspacing="0" border="0">
			
			<tr>
				<td width="250">
					<!-- GENERAL -->
					<?php
					unset($checks);
					$checks['options'] = $permissions['general'];
					$checks['group_id'] = $group_id;
					$checks['category'] = 'General';
					$this->load->view('security/permissions.checks.php', $checks);
					?>
				</td>
				<td width="50">&nbsp;</td>
				<td width="350">
					<!-- BOOKINGS -->
					<?php
					unset($checks);
					$checks['options'] = $permissions['bookings'];
					$checks['group_id'] = $group_id;
					$checks['category'] = 'Bookings';
					$this->load->view('security/permissions.checks.php', $checks);
					?>
				</td>
			</tr>
			
			<tr>
				<td>
					<!-- ROOMS -->
					<?php
					unset($checks);
					$checks['options'] = $permissions['rooms'];
					$checks['group_id'] = $group_id;
					$checks['category'] = 'Rooms';
					$this->load->view('security/permissions.checks.php', $checks);
					?>
				</td>
				<td width="50">&nbsp;</td>
				<td>
					<!-- PERIODS -->
					<?php
					unset($checks);
					$checks['options'] = $permissions['periods'];
					$checks['group_id'] = $group_id;
					$checks['category'] = 'Periods';
					$this->load->view('security/permissions.checks.php', $checks);
					?>
				</td>
			</tr>
			
			<tr>
				<td>
					<!-- WEEKS -->
					<?php
					unset($checks);
					$checks['options'] = $permissions['weeks'];
					$checks['group_id'] = $group_id;
					$checks['category'] = 'Weeks / Academic year';
					$this->load->view('security/permissions.checks.php', $checks);
					?>
				</td>
				<td width="50">&nbsp;</td>
				<td>
					<!-- HOLIDAYS -->
					<?php
					unset($checks);
					$checks['options'] = $permissions['holidays'];
					$checks['group_id'] = $group_id;
					$checks['category'] = 'Holidays';
					$this->load->view('security/permissions.checks.php', $checks);
					?>
				</td>
			</tr>
			
			<tr>
				<td>
					<!-- DEPARTMENTS -->
					<?php
					unset($checks);
					$checks['options'] = $permissions['departments'];
					$checks['group_id'] = $group_id;
					$checks['category'] = 'Departments';
					$this->load->view('security/permissions.checks.php', $checks);
					?>
				</td>
				<td width="50">&nbsp;</td>
				<td>
					<!-- REPORTS -->
					<?php
					unset($checks);
					$checks['options'] = $permissions['reports'];
					$checks['group_id'] = $group_id;
					$checks['category'] = 'Reports';
					$this->load->view('security/permissions.checks.php', $checks);
					?>
				</td>
			</tr>
			
			<tr>
				<td>
					<!-- SECURITY -->
					<?php
					unset($checks);
					$checks['options'] = $permissions['users'];
					$checks['group_id'] = $group_id;
					$checks['category'] = 'Security - Users';
					$this->load->view('security/permissions.checks.php', $checks);
					?>
				</td>
				<td width="50">&nbsp;</td>
				<td>
					<!-- GROUPS -->
					<?php
					unset($checks);
					$checks['options'] = $permissions['groups'];
					$checks['group_id'] = $group_id;
					$checks['category'] = 'Security - Groups';
					$this->load->view('security/permissions.checks.php', $checks);
					?>
				</td>
			</tr>
			
			<tr>
				<td colspan="3">
					<table class="form" cellpadding="0" cellspacing="0" border="0" width="100%">
						<?php
						unset($buttons);
						$buttons[] = array('submit', 'positive', 'Save group permissions', 'disk1.gif', 0);
						$this->load->view('parts/buttons', array('buttons' => $buttons));
						?>
					</table>
				</td>
			</tr>

		</table>
		</form>
			
	<?php
		echo '</div>';
	}
	?>

</div>
