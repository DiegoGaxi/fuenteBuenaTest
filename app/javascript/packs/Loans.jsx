import React from "react";
import Amortization from "./Amortization";
import { useEffect, useState } from "react";
import { formatNumero } from "./helper.jsx";
import axios from "axios";
import {
  Container,
  Form,
  Row,
  Col,
  Alert,
  Button,
  Spinner,
} from "react-bootstrap";

function Loans() {
  const [loan, setLoan] = useState(null);
  const [formulario, setFormulario] = useState({});
  const [loading, setLoading] = useState(false);
  const [saved, setSaved] = useState(false);

  const getPrestamo = async (e) => {
    setLoading(true);
    await axios
      .get(
        "getPrestamo/" +
          formulario.principal +
          "/" +
          formulario.interes +
          "/" +
          formulario.plazo
      )
      .then((res) => {
        setLoan(res.data);
        setLoading(false);
      })
      .catch((err) => {
        console.log(err);
        setLoading(false);
      });
  };

  const guardarPrestamo = async (loan) => {
    setLoading(true);
    loan.cliente_id = formulario?.cliente?._id;
    await axios
      .post("guardarPrestamo", loan)
      .then((res) => {
        setLoading(false);
        setSaved(true);
        setFormulario({ principal: "", interes: "", plazo: "" });
        setLoan(null);
        getCliente();
        setTimeout(() => {
          setSaved(false);
        }, 1400);
      })
      .catch((err) => {
        console.log(err);
        setLoading(false);
      });
  };

  const getCliente = async (e) => {
    setLoading(true);
    await axios.get("getClienteMongo").then((res) => {
      setLoading(false);
      setFormulario({ cliente: res.data });
    });
  };

  useEffect(() => {
    getCliente();
  }, []);

  return (
    <>
      <Container fluid className={"container centered"}>
        <Row>
          <Col>
            <h1> Calculadora de Prestamos</h1>
            <h4> Cliente: {formulario?.cliente?.name} </h4>
            <h5>
              Actual en Prestamo:
              {formatNumero(parseFloat(formulario?.cliente?.prestado), "$")}
            </h5>
          </Col>
        </Row>
        <Row>
          <Form
            className="form"
            onSubmit={(e) => {
              e.preventDefault();
              getPrestamo(e);
            }}
          >
            <Col lg={4}>
              <Form.Label>Principal</Form.Label>
              <Form.Group controlId="formBasicEmail">
                <Form.Control
                  step="0.1"
                  className={"transparent"}
                  required
                  min="0"
                  type="number"
                  placeholder="Ingresa el monto del prestamo"
                  value={formulario?.principal}
                  onChange={(e) => {
                    setFormulario({
                      ...formulario,
                      principal: parseFloat(e.target.value),
                    });
                  }}
                />
              </Form.Group>
            </Col>

            <Col lg={4}>
              <Form.Label>Interes</Form.Label>
              <Form.Group controlId="formBasicInteres">
                <Form.Control
                  step="0.1"
                  min="0"
                  className={"transparent"}
                  required
                  type="number"
                  placeholder="Ingresar el interes del prestamo"
                  value={formulario?.interes}
                  onChange={(e) => {
                    setFormulario({
                      ...formulario,
                      interes: parseFloat(e.target.value),
                    });
                  }}
                />
              </Form.Group>
            </Col>

            <Col lg={4}>
              <Form.Label>Plazo</Form.Label>
              <Form.Group controlId="formBasicSelect">
                <Form.Control
                  className={"transparent"}
                  required
                  as="select"
                  value={formulario?.plazo}
                  onChange={(e) => {
                    setFormulario({ ...formulario, plazo: e.target.value });
                  }}
                >
                  <option value="">Seleccione el plazo</option>
                  <option value="12">12 meses</option>
                  <option value="24">24 meses</option>
                  <option value="36">36 meses</option>
                  <option value="48">48 meses</option>
                  <option value="60">60 meses</option>
                </Form.Control>
              </Form.Group>
            </Col>
            <Col lg={4} className="mt-2">
              <Button type="submit" variant="white" className=" button">
                Calcular
              </Button>
            </Col>
          </Form>
        </Row>

        {loan && (
          <Row className="centered">
            <Row>
              <Col>
                <h3>
                  Pago periódico:
                  {formatNumero(
                    parseFloat(loan.pago_capital_con_intereses),
                    "$"
                  )}
                </h3>
              </Col>
              {/* <Col>
                <h3>Intereses Totales: {formatNumero(parseFloat(loan.intereses_totales), "$")} </h3>
              </Col> */}
              <Col>
                <h3>
                  Monto Final:
                  {formatNumero(parseFloat(loan.monto_final_prestamo), "$")}
                </h3>
              </Col>
            </Row>

            <Col md={12}>
              <Button
                size="sm"
                variant="white"
                className="button"
                onClick={() => {
                  guardarPrestamo(loan);
                }}
              >
                Guardar Prestamo
              </Button>
            </Col>
          </Row>
        )}

        <Row>
          <Col lg={12}>
            <Amortization loan={loan} />
          </Col>
        </Row>
      </Container>

      {loading && (
        <Alert className="centered alert">
          <Alert.Heading>Cargando...</Alert.Heading>
          <Spinner animation="border" />
        </Alert>
      )}

      {saved && (
        <Alert className="centered alert success">
          <Alert.Heading> Guardado</Alert.Heading>
        </Alert>
      )}
    </>
  );
}

export default Loans;
