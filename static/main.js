const recaudacionForm = document.querySelector("#recaudacionForm");
const recaudacionesList=document.querySelector("#recaudacionesList");

let recaudaciones=[]

window.addEventListener("DOMContentLoaded", async () => {
  const response = await fetch("/api/recaudacion");
  const data = await response.json();
  recaudaciones = data;
  renderRecaudaciones(recaudaciones);
});

recaudacionForm.addEventListener('submit', async (e) => {
  e.preventDefault();
  const codAdministrador = recaudacionForm['CodAdministrador'].value
  const dniResidente = recaudacionForm['dniResidente'].value
  const metodoPago = recaudacionForm['metodoPago'].value
  const importe = recaudacionForm['importe'].value

  const response = await fetch("/api/recaudacion", {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
    },
    body: JSON.stringify({
      codAdministrador,
      dniResidente,
      metodoPago,
      importe
    })
  })

  const data = await response.json();
  
  console.log(data);
})

function renderRecaudaciones(recaudaciones) {
  recaudacionesList.innerHTML = "";


  recaudaciones.forEach((recaudacion) => {
    const recaudacionItem = document.createElement("li")
    recaudacionItem.classList = "list-group-item list-group-item-dark my-2";
    recaudacionItem.innerHTML = `
    <h5>Código de recaudación : ${recaudacion.codrecaudacion}</h5>    
    <p>Fecha de recaudación : ${recaudacion.fecha}</p>
    <p>Método de pago : ${recaudacion.metodopago}</p>
    <p>Importe : ${recaudacion.importe}</p>
    <p>DNI del residente : ${recaudacion.dniresidente}</p>
    <p>Código del administrador : ${recaudacion.codadministrador}</p>
    `
    console.log(recaudacionItem)
    recaudacionesList.append(recaudacionItem)
  })  
}