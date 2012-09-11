function frmFichaClinicaOcupacional() {
    function per(salada) {
        var alvo = document.getElementById(salada);
        var gat = 'rd'+salada.substring(0,1).toUpperCase()+salada.substring(1);
        if (document.getElementById(gat+'_0').checked == true) {
            alvo.disabled = true;
        } else {
            alvo.disabled = false;
        }
        var tob = function () {
            if (document.getElementById(gat+'_0').checked == true) {
                alvo.value = "";
                alvo.disabled = true;
            } else {
                alvo.disabled = false;
            }
        };
        document.getElementById(gat+'_0').onclick = tob;
        document.getElementById(gat+'_1').onclick = tob;
    }    
    per("queixaclinica");
    per("antecedenteclinico");
    per("antecedentecirurgico");
    per("antecedenteocupacional");
    per("epilepsia");
    per("medicamento");
    per("tabagismo");
    per("etilismo");
    per("alergia");
    per("examefisico");
    per("examecomplementar");
    per("avaliacaourologica");
    /*var man = ["queixaclinica","antecedenteclinico","antecedentecirurgico","antecedenteocupacional","epilepsia","medicamento","tabagismo","etilismo","alergia","examefisico","examecomplementar","avaliacaourologica"];
    for (var i in man) {
        per(man[i]);
    }*/
    var alvo = document.getElementById("atividadefisica");
    var alvo2 = document.getElementById('frequencia');
    if (document.getElementById('rdAtividadefisica_0').checked == true) {    
        alvo.disabled = true;
        alvo2.disabled = true;
    } else {
        alvo.disabled = false;
        alvo2.disabled = false;
    }
    var tob = function () {
        if (document.getElementById('rdAtividadefisica_0').checked == true) {
            alvo.value = "";
            alvo2.value = "";
            alvo.disabled = true;
            alvo2.disabled = true;
        } else {
            alvo.disabled = false;
            alvo2.disabled = false;
        }
    };
    document.getElementById('rdAtividadefisica_0').onclick = tob;
    document.getElementById('rdAtividadefisica_1').onclick = tob;
    function ckFunant() {
        if (document.getElementById("ckFuncaoanterior").checked == true) {
            var alvo = document.getElementById("funcaoanterior");
            alvo.value = "";
            alvo.disabled = true;
        } else {
            document.getElementById("funcaoanterior").disabled = false;
        }
    };
    ckFunant();
    document.getElementById("ckFuncaoanterior").onclick = function() { ckFunant(); };
    function dos(dof) {
        if (document.getElementById("ck"+dof.substring(0,1).toUpperCase()+dof.substring(1)).checked == true) {            
            document.getElementById(dof).disabled = false;
        } else {            
            document.getElementById(dof).disabled = true;
        }
        document.getElementById("ck"+dof.substring(0,1).toUpperCase()+dof.substring(1)).onclick = function() {
            if (this.checked == true) {
                document.getElementById(dof).disabled = false;
            } else {
                var alvo = document.getElementById(dof);
                alvo.value = "";
                alvo.disabled = true;            
            }
        };
    }    
    dos("pendente");
    dos("colunador");
    dos("superiordor");
    dos("inferiordor");
    /* var man = ["pendente","colunador","superiordor","inferiordor"];
    for (var i in man) {
        dos(man[i]);
    }*/
    if (document.getElementById("superiorparesia").checked == true || document.getElementById("superiorparestesia").checked == true) {
        document.getElementById("superiorlocalizacao").disabled = false;
    } else {
        document.getElementById("superiorlocalizacao").disabled = true;
    }    
    if (document.getElementById("inferiorparesia").checked == true || document.getElementById("inferiorparestesia").checked == true) {
        document.getElementById("inferiorlocalizacao").disabled = false;
    } else {
        document.getElementById("inferiorlocalizacao").disabled = true;
    }
    function pares(pr) {
        if (document.getElementById(pr+"paresia").checked == true || document.getElementById(pr+"parestesia").checked == true) {
            document.getElementById(pr+"localizacao").disabled = false;
        } else {
            var alvo = document.getElementById(pr+"localizacao");
            alvo.value = "";
            alvo.disabled = true;            
        }
    };
    document.getElementById("superiorparesia").onclick = function () { pares("superior"); };
    document.getElementById("superiorparestesia").onclick = function () { pares("superior"); };
    document.getElementById("inferiorparesia").onclick = function () { pares("inferior"); };
    document.getElementById("inferiorparestesia").onclick = function () { pares("inferior"); };
    function cage() {
        var resultado = 0;        
        for (var i=0;i<4;i++) {
            if (document.getElementById("cage"+(i+1)+"_0").checked == true) {
                resultado++;
            }
        }
        if (resultado > 1) {
            document.getElementById("resultado_cage").innerHTML = "<b>Positivo</b>";
            document.getElementById("resultado_cage").style.color = "red";
        } else {
            document.getElementById("resultado_cage").innerHTML = "<b>Negativo</b>";
            document.getElementById("resultado_cage").style.color = "green";
        }
    }
    for (var i=0;i<4;i++) for (var j=0;j<2;j++) document.getElementById("cage"+(i+1)+"_"+j).onclick = function () { cage(); };
    function fager() {

        var resultado = 0;
        
        if (document.getElementById("fager1_0").checked == true) {
            resultado += 3;
        }

        if (document.getElementById("fager1_1").checked == true) {
            resultado += 2;
        }

        if (document.getElementById("fager1_2").checked == true) {
            resultado += 1;
        }

        if (document.getElementById("fager2_0").checked == true) {
            resultado += 1;
        }

        if (document.getElementById("fager3_0").checked == true) {
            resultado += 1;
        }

        if (document.getElementById("fager4_1").checked == true) {
            resultado += 1;
        }

        if (document.getElementById("fager4_2").checked == true) {
            resultado += 2;
        }

        if (document.getElementById("fager4_3").checked == true) {
            resultado += 3;
        }

        if (document.getElementById("fager5_0").checked == true) {
            resultado += 1;
        }

        if (document.getElementById("fager6_0").checked == true) {
            resultado += 1;
        }

        if (resultado <= 2) {
            document.getElementById("resultado_fager").innerHTML = "<b>muito baixo</b>";
            document.getElementById("resultado_fager").style.color = "green";
        }

        if (resultado == 3 || resultado == 4) {
            document.getElementById("resultado_fager").innerHTML = "<b>baixo</b>";
            document.getElementById("resultado_fager").style.color = "green";
        }

        if (resultado == 5) {
            document.getElementById("resultado_fager").innerHTML = "<b>m&eacute;dio</b>";
            document.getElementById("resultado_fager").style.color = "black";
        }

        if (resultado == 6 || resultado == 7) {
            document.getElementById("resultado_fager").innerHTML = "<b>elevado</b>";
            document.getElementById("resultado_fager").style.color = "red";
        }
        
        if (resultado >= 8) {
            document.getElementById("resultado_fager").innerHTML = "<b>muito elevado</b>";
            document.getElementById("resultado_fager").style.color = "red";
        }

    }

    document.getElementById("fager1_0").onclick = function () { fager(); };
    document.getElementById("fager1_1").onclick = function () { fager(); };
    document.getElementById("fager1_2").onclick = function () { fager(); };
    document.getElementById("fager1_3").onclick = function () { fager(); };
    document.getElementById("fager2_0").onclick = function () { fager(); };
    document.getElementById("fager2_1").onclick = function () { fager(); };
    document.getElementById("fager3_0").onclick = function () { fager(); };
    document.getElementById("fager3_1").onclick = function () { fager(); };
    document.getElementById("fager4_0").onclick = function () { fager(); };
    document.getElementById("fager4_1").onclick = function () { fager(); };
    document.getElementById("fager4_2").onclick = function () { fager(); };
    document.getElementById("fager4_3").onclick = function () { fager(); };
    document.getElementById("fager5_0").onclick = function () { fager(); };
    document.getElementById("fager5_1").onclick = function () { fager(); };
    document.getElementById("fager6_0").onclick = function () { fager(); };
    document.getElementById("fager6_1").onclick = function () { fager(); };

    document.getElementById("funcaoanterior").onkeyup = function () { 
        if (this.value.length > 0) {
            document.getElementById("ckFuncaoanterior").checked = '';
        } else {
            document.getElementById("ckFuncaoanterior").checked = 'true';
        }
    };

    document.getElementById("funcaoanterior").onblur = function () { 
        ckFunant();
    }

    cage();
    fager();
}

dojo.addOnLoad(frmFichaClinicaOcupacional);