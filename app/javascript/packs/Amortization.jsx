import React from "react";

import { useEffect, useState } from "react";

function Amortization({ loan }) {
  const [amortization, setAmortization] = useState([]);

  useEffect(() => {}, []);

  return (
    <>
      <h1> Amortizacion </h1>
      <table style={tabla}>
        <thead>
          <tr>
            <th>#</th>
            <th>Fecha</th>
            <th>Interes</th>
            <th>Pago Capital</th>
            <th>Pago Capital Con Interes</th>
            <th>Saldo Insoluto</th>
          </tr>
        </thead>
        <tbody>
          {amortization.map((item, index) => (
            <tr key={index}>
              <td>{index + 1}</td>
              <td>{item.fecha}</td>
              <td>{item.interes}</td>
              <td>{item.pago_capital}</td>
              <td>{item.pago_capital_con_interes}</td>
              <td>{item.saldo_insoluto}</td>
            </tr>
          ))}
        </tbody>
      </table>
    </>
  );
}

const tabla = {
  overflowX: "auto",
  maxWidth: "97%",
};

// .tabla {
//     /* margin: 3vh; */
//     overflow-x: auto;
//     max-width: 97vw;
//     background-image: white;
//     border-radius: 10px;
//     font-size: 13px;
//     line-height: normal;
//     display: -webkit-box;
//     vertical-align: inherit;
//     text-align: center !important;
//     color: #304891;
//     text-indent: initial;
//     border-spacing: 10px 0px !important;
//     border-collapse: inherit !important;
//     text-overflow: ellipsis;
//     -webkit-box-pack: center;
//   }

//   .tabla th {
//     font-size: 15px;
//     text-align-last: center;
//     padding: 12px;
//     text-transform: capitalize;
//     text-align: center !important;
//     background-color: rgba(114, 114, 114, 0.096);
//     max-width: auto;
//     border: none !important;
//     color: #192a5a;
//     vertical-align: middle !important;
//     text-align: -webkit-center !important;
//   }

//   .tabla td {
//     padding: 9px;
//     white-space: nowrap;
//     color: #000000;
//     text-align: center;
//     border-top: none !important;
//     vertical-align: middle !important;
//     border-bottom: 1px solid rgba(187, 196, 197, 0.835);
//     text-align: -webkit-center !important;
//   }

export default Amortization;
