<?php
	require_once('modelo/conexion.php');
	require_once('modelo/mpag.php');
	require_once("modelo/mpagina.php");

	$pg = 203;
	$arc = "home.php";
	$mpag = new mpag();
	$pagid = isset($_POST['pagid']) ? $_POST['pagid']:NULL;
	if(!$pagid)
		$pagid = isset($_GET['pagid']) ? $_GET['pagid']:NULL;
	$pagnom = isset($_POST['pagnom']) ? $_POST['pagnom']:NULL;
	$pagarc = isset($_POST['pagarc']) ? $_POST['pagarc']:NULL;
	$pagmos = isset($_POST['pagmos']) ? $_POST['pagmos']:NULL;
	$pagord = isset($_POST['pagord']) ? $_POST['pagord']:NULL;
	$pagmen = isset($_POST['pagmen']) ? $_POST['pagmen']:NULL;

	$filtro = isset($_GET["filtro"]) ? $_GET["filtro"]:NULL;


	$opera = isset($_POST['opera']) ? $_POST['opera']:NULL;
	if(!$opera)
		$opera = isset($_GET['opera']) ? $_GET['opera']:NULL;

//Insertar
	if($opera=="insertar"){
		if ($pagnom && $pagarc && $pagmos && $pagord && $pagmen){
			$result=$mpag->inspag($pagid, $pagnom, $pagarc, $pagmos, $pagord, $pagmen);
			$pagid = "";
		}
		else{
			echo "<script>alert('FAVOR LLENAR TODOS LOS CAMPOS')</script>";
		}
		$opera = "";
	}

//Actualizar
	if($opera=="actualizar"){
		if ($pagid && $pagnom && $pagarc && $pagmos && $pagord && $pagmen){
			$result=$mpag->updpag("pagnom", $pagnom, $pagid);
			$result=$mpag->updpag("pagarc", $pagarc, $pagid);
			$result=$mpag->updpag("pagmos", $pagmos, $pagid);
			$result=$mpag->updpag("pagord", $pagord, $pagid);
			$result=$mpag->updpag("pagmen", $pagmen, $pagid);
			$pagid = "";
		}
		else{
			echo "<script>alert('HAY CAMPOS VACIOS')</script>";
		}
		$opera = "";
	}


//Eliminar
	if($opera=="eliminar"){
		if ($pagid){
			$result=$mpag->elipag($pagid);
			$pagid = "";
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
	$conp = $mpag->sqlcount($filtro);

	function cargar($conp,$nreg,$pg,$bo,$filtro,$arc){
		$mpag=new mpag();
		$pa = new mpagina($nreg);

		$txt = '<div align="center" style="padding-bottom: 20px;">';
        $txt .= '<table>';
          $txt .= '<tr>';
            $txt .= '<td>';
              $txt .= '<form id="formfil" name="frmfil" method="GET" action="'.$arc.'" class="txtbold">';
                $txt .= '<input name="pg" type="hidden" value="'.$pg.'" />';
                $txt .= '<input class="form-control" type="text" name="filtro" value="'.$filtro.'" placeholder="Nombre de página" onChange="this.form.submit();">';
              $txt .= '</form>';
            $txt .= '</td>';
            $txt .= '<td align="right" style="padding-left: 10px;">';

            $bo = "<input type='hidden' name='filtro' value='".$filtro."' />";
            $txt .= $pa->spag($conp,$nreg,$pg,$bo,$arc); 
            $result = $mpag->selpag($filtro, $pa->rvalini(), $pa->rvalfin());

            $txt .= '</td>';
          $txt .= '</tr>';
      $txt .= '</table>';
      $txt .= '</div>';

		if ($result){
			$txt .= "<table class='table table-hover'>
				<tr>
					<th class='success'>Nombre</th>
					<th class='success'>Mostrar</th>
					<th class='success'>Orden</th>
					<th class='success'></th>
					<th class='success'></th>
				</tr>";
				foreach ($result as $f){	
					$txt .= "<tr>";
						$txt .= "<td class='active'>";
						$txt .= "<span style='font-size: 20px;'><strong>".$f['pagid']." - ".$f['pagnom']."</strong></span>";
						$txt .= "<br><strong>Archivo: </strong>".$f['pagarc'];
						$txt .= "<br><strong>Menu: </strong>".$f['pagmen'];
						$txt .= "</td>";
						$txt .= "<td class='active' align='center'>";
						if($f['pagmos']==1)
							$txt .= "<img src='image/o.png'>";
						else
							$txt .= "<img src='image/x.png'>";
						$txt .= "</td>";
						$txt .= "<td class='active' align='center'>".$f['pagord']."</td>";
						$txt .= "<td class='warning' align='center'><a href='home.php?pagid=".$f['pagid']."&pg=".$pg."'><img src='image/new.png' title='Actualizar'></a>";
						$txt .= "</td><td class='warning' align='center'>";
						$txt .= "<a href='home.php?pagid=".$f['pagid']."&opera=eliminar&pg=".$pg."' onclick='return eliminar();'><img src='image/trash.png' title='Eliminar'></a></td>";
					$txt .= "</tr>";
				}
			$txt .= "</table>";
			echo $txt;
		}
	}

	function seleccionar($pagid, $pg){
		if($pagid){
			$mpag=new mpag();
			$result=$mpag->selpag1($pagid);
		}
		$txt = '<form action="home.php?pg='.$pg.'" method="POST">
			<div class="container">';
				$txt .= '<label>C&oacute;digo</label>';
				$txt .= '<input type="number" name="pagid" value="';
					if($pagid) $txt .= $result[0]['pagid'];
				$txt .= '"';
					if($pagid) $txt .= ' readonly';
				$txt .= ' required class="form-control">';
				$txt .= '<label>Nombre</label>';
				$txt .= '<input type="text" name="pagnom" value="';
					if($pagid){ $txt .= $result[0]['pagnom']; }
				$txt .= '" required class="form-control">';
				$txt .= '<label>Archivo</label>';
				$txt .= '<input type="text" name="pagarc" value="';
					if($pagid){ $txt .= $result[0]['pagarc']; }
				$txt .= '" required class="form-control">';

				$txt .= '<label>Mostrar</label>';
				$txt .= '<select name="pagmos" class="form-control">';
					$txt .= '<option value="1"';
						if($pagid and $result[0]['pagmos']==1){ $txt .= " selected "; }
					$txt .= '>Si</option>';
					$txt .= '<option value="2"';
						if($pagid and $result[0]['pagmos']<>1){ $txt .= " selected "; }
					$txt .= '>No</option>';
				$txt .= '</select>';

				$txt .= '<label>Men&uacute;</label>';
				$txt .= '<select name="pagmen" class="form-control">';
					$txt .= '<option value="Home"';
						if($pagid and $result[0]['pagmen']=="Home"){ $txt .= " selected "; }
					$txt .= '>Home</option>';
					$txt .= '<option value="Index"';
						if($pagid and $result[0]['pagmen']=="Index"){ $txt .= " selected "; }
					$txt .= '>Index</option>';
				$txt .= '</select>';

				$txt .= '<label>Orden</label>';
				$txt .= '<input type="number" name="pagord" value="';
					if($pagid){ $txt .= $result[0]['pagord']; }
				$txt .= '" required class="form-control">';
				$txt .= '<input type="hidden" name="opera" value="';
					if($pagid){ $txt .= "actualizar"; } else { $txt .= "insertar"; }
				$txt .= '"><br><center><button type="submit" class="btn btn-success">';
					if($pagid){ $txt .= "Actualizar"; } else { $txt .= "Registrar"; }
				$txt .= '</button>';
				$txt .= '&nbsp;&nbsp;&nbsp;';

				$txt .= '<input type="reset" class="btn btn-success" value="';
					if($pagid){ $txt .= "Cancelar"; } else { $txt .= "Limpiar"; }
				$txt .= '"';
					if($pagid) $txt .= " onclick='window.history.back();' ";
				$txt .= ' />';

				$txt .= '</center>
			</div>
		</form>';
		echo $txt;
	}
?>