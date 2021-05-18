<?php
	require_once('modelo/conexion.php');
	require_once('modelo/mpef.php');
	require_once("modelo/mpagina.php");

	$pg = 204;
	$arc = "home.php";
	$mtac = new mpef();
	$pefid = isset($_POST['pefid']) ? $_POST['pefid']:NULL;
	if(!$pefid)
		$pefid = isset($_GET['pefid']) ? $_GET['pefid']:NULL;
	$pefnom = isset($_POST['pefnom']) ? $_POST['pefnom']:NULL;

	$pefcan = isset($_POST['pefcan']) ? $_POST['pefcan']:NULL;

	$filtro = isset($_GET["filtro"]) ? $_GET["filtro"]:NULL;

	$opera = isset($_POST['opera']) ? $_POST['opera']:NULL;
	if(!$opera)
		$opera = isset($_GET['opera']) ? $_GET['opera']:NULL;


//Insertar
	if($opera=="insertar"){
		if ($pefnom){

			$result=$mtac->inspag($pefnom);
			$pefid = "";
		}
		else{
			echo "<script>alert('FAVOR LLENAR TODOS LOS CAMPOS')</script>";
		}
		$opera = "";
	}

//Agregar
	if($opera=="agregar"){
		if ($pefid AND $pefcan){
			$result=$mtac->elipg($pefid);
			for ($i=0; $i < $pefcan; $i++) { 
				$chk = isset($_POST['chk'.$i]) ? $_POST['chk'.$i]:NULL;
				if($chk)
					$result=$mtac->insagre($chk, $pefid);
			}
				
				
			$pefid = "";
		}
		else{
			echo "<script>alert('FAVOR LLENAR TODOS LOS CAMPOS')</script>";
		}
		$opera = "";
	}

//Actualizar
	if($opera=="actualizar"){
		if ($pefid && $pefnom){
			$result=$mtac->updpag("pefnom", $pefnom, $pefid);
			$pefid = "";
		}
		else{
			echo "<script>alert('HAY CAMPOS VACIOS')</script>";
		}
		$opera = "";
	}


//Eliminar
	if($opera=="eliminar"){
		if ($pefid){
			$result=$mtac->elipag($pefid);
			$pefid = "";
		}
		else{
			echo "<script>alert('ERROR AL ELIMINAR')</script>";
		}
		$opera = "";
	}

//Paginacion
	$bo="";
	$nreg = 10; 
	$pa = new mpagina();
	$preg = $pa->mpagin($nreg);
	$conp = $mtac->sqlcount($filtro);

	function cargar($conp,$nreg,$pg,$bo,$filtro,$arc){
		$mtac=new mpef();
		$pa = new mpagina($nreg);

		$txt = '<div align="center" style="padding-bottom: 20px;">';
        $txt .= '<table>';
          $txt .= '<tr>';
            $txt .= '<td>';
              $txt .= '<form id="formfil" name="frmfil" method="GET" action="'.$arc.'" class="txtbold">';
                $txt .= '<input name="pg" type="hidden" value="'.$pg.'" />';
                $txt .= '<input class="form-control" type="text" name="filtro" value="'.$filtro.'" placeholder="Nombre de perfil" onChange="this.form.submit();">';
              $txt .= '</form>';
            $txt .= '</td>';
            $txt .= '<td align="right" style="padding-left: 10px;">';

            $bo = "<input type='hidden' name='filtro' value='".$filtro."' />";
            $txt .= $pa->spag($conp,$nreg,$pg,$bo,$arc); 
            $result = $mtac->selpag($filtro, $pa->rvalini(), $pa->rvalfin());

            $txt .= '</td>';
            $txt .= '<td>';
            $txt .= '</td>';
          $txt .= '</tr>';
      $txt .= '</table>';
      $txt .= '</div>';

		if ($result){
			$txt .= "<table class='table table-hover'>
				<tr>
					<th class='success'>Perfil</th>
					<th class='success'>P&aacute;gina</th>
					<th class='success'></th>
					<th class='success'></th>
				</tr>";
				foreach ($result as $f){	
					$txt .= "<tr>";
						//$txt .= "<td class='active' align='center'>".$f['pefid']."</td>";
						$txt .= "<td class='active'>".$f['pefnom']."</td>";

						$txt .= "<td class='active' align='center'><button data-toggle='modal' data-target='#myModal".$f['pefid']."'><img src='image/eye.png' title='Agregar archivo'></button>";
						$txt .= modal($f['pefid'],$f['pefnom'], $pg);
						$txt .= "</td>";
						$txt .= "<td class='warning' align='center'><a href='home.php?pefid=".$f['pefid']."&pg=".$pg."'><img src='image/new.png' title='Actualizar'></a>";
						$txt .= "</td><td class='warning' align='center'>";
						$txt .= "<a href='home.php?pefid=".$f['pefid']."&opera=eliminar&pg=".$pg."' onclick='return eliminar();'><img src='image/trash.png' title='Eliminar'></a></td>";
					$txt .= "</tr>";
				}
			$txt .= "</table>";
			echo $txt;
		}
	}

	function modal($pefid, $pefnom, $pg){
		$mpef=new mpef();
		$result = $mpef->selpg();
		$respxp = $mpef->selpxp($pefid);
		$tx = '<div class="modal fade" id="myModal'.$pefid.'" role="dialog">';
          $tx .= '<div class="modal-dialog">';
            $tx .= '<div class="modal-content">';
              $tx .= '<div class="modal-header">';
                $tx .= '<button type="button" class="close" data-dismiss="modal">&times;</button>';
                $tx .= '<h2 class="modal-title">Paginas</h2>';
                $tx .= '<h4>Perfil: '.$pefnom.'</h4>';
              $tx .= '</div>';
              $tx .= '<form name="frmece" action="home.php?pg='.$pg.'" method="POST"">';
                $tx .= '<div class="modal-body">';
                $m = 0;
				  foreach ($result as $f){
				  	$tx .= '<div style="width: 130px;text-align: left;float: left;">';
				  	$tx .= '<input type="checkbox" name="chk'.$m.'" value="';
				  	$tx .= $f['pagid'].'"';
				  	if($respxp){
					  	foreach ($respxp as $x){
					  		if($f['pagid']==$x['pagid'])
					  		$tx .= ' checked ';
					  	}
					}
				  	$tx .= '>';
				  	$tx .= '&nbsp;&nbsp;&nbsp;'.$f['pagnom']."</div>";
				  	$m++;
				  }

				  $tx .= '<input type="hidden" name="pefid" value="'.$pefid.'">';
				  $tx .= '<input type="hidden" name="pefnom" value="'.$pefnom.'">';
				  $tx .= '<input type="hidden" name="pefcan" value="'.count($result).'">';
				  $tx .= '<input type="hidden" name="opera" value="agregar">';
                $tx .= '</div>';
                $tx .= '<div class="modal-footer">';
                  $tx .= '<input name="guper" type="submit" class="btn btn-default" value="Enviar">';
                  $tx .= '<button class="btn btn-default" data-dismiss="modal">Cerrar</button>';
                $tx .= '</div>';
              $tx .= '</form>';
            $tx .= '</div>';
          $tx .= '</div>';                             
        $tx .= '</div>';
        return $tx;
	}

	function seleccionar($pefid, $pg){
		$mtac=new mpef();
		if($pefid){
			$result=$mtac->selpag1($pefid);
		}
		$txt = '<form action="home.php?pg='.$pg.'" method="POST">
			<div class="container">';
				/*$txt .= '<label>C&oacute;digo</label>';
				$txt .= '<input type="number" name="pefid" value="';
					if($pefid) $txt .= $result[0]['pefid'];
				$txt .= '"';
					if($pefid) $txt .= ' readonly';
				$txt .= ' required class="form-control">';*/
				
				if($pefid){
					$txt .= '<label>C&oacute;digo</label>';
					$txt .= '<input type="number" name="pefid" value="'.$result[0]['pefid'].'" readonly required class="form-control">';
				}

				$txt .= '<label>Nombre Perfil</label>';
				$txt .= '<input type="text" name="pefnom" value="';
					if($pefid){ $txt .= $result[0]['pefnom']; }
				$txt .= '" required class="form-control">';


				$txt .= '<input type="hidden" name="opera" value="';
					if($pefid){ $txt .= "actualizar"; } else { $txt .= "insertar"; }
				$txt .= '"><br><center><button type="submit" class="btn btn-success">';
					if($pefid){ $txt .= "Actualizar"; } else { $txt .= "Registrar"; }
				$txt .= '</button>';
				$txt .= '&nbsp;&nbsp;&nbsp;';

				$txt .= '<input type="reset" class="btn btn-success" value="';
					if($pefid){ $txt .= "Cancelar"; } else { $txt .= "Limpiar"; }
				$txt .= '"';
					if($pefid) $txt .= " onclick='window.history.back();' ";
				$txt .= ' />';

				$txt .= '</center>
			</div>
		</form>';
		echo $txt;
	}
?>