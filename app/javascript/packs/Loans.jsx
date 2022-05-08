import React from "react";
import Amortization from "./Amortization";
import { useEffect, useState } from "react";

import { Container, Form, Row, Col, Modal, Button } from "react-bootstrap";

function Loans() {
  const [loan, setLoan] = useState({});
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    setTimeout(() => {
      setLoading(false);
    }, 1000);
  }, []);

  return (
    <>
      <Container fluid style={container}>
        <Row>
          <Col>
            <h1> Calculadora de Prestamos</h1>
          </Col>
        </Row>
        <Row>
          <Form
            style={form}
            onSubmit={(e) => {
              e.preventDefault();
            }}
          >
            <Col>
              <Form.Label>Principal</Form.Label>
              <Form.Group controlId="formBasicEmail">
                <Form.Control
                  required
                  type="number"
                  placeholder="Ingresa el monto del prestamo"
                  onChange={(e) => {
                    setLoan({ ...loan, principal: e.target.value });
                  }}
                />
              </Form.Group>
            </Col>

            <Col>
              <Form.Label>Interes</Form.Label>
              <Form.Group controlId="formBasicInteres">
                <Form.Control
                  required
                  type="number"
                  placeholder="Ingresar el interes del prestamo"
                  onChange={(e) => {
                    setLoan({ ...loan, interest: e.target.value });
                  }}
                />
              </Form.Group>
            </Col>

            <Col>
              <Form.Label>Plazo</Form.Label>
              <Form.Group controlId="formBasicSelect">
                <Form.Control
                  required
                  as="select"
                  onChange={(e) => {
                    setLoan({ ...loan, term: e.target.value });
                  }}
                >
                  <option value="12">12 meses</option>
                  <option value="24">24 meses</option>
                  <option value="36">36 meses</option>
                  <option value="48">48 meses</option>
                  <option value="60">60 meses</option>
                </Form.Control>
              </Form.Group>
            </Col>

            <Col>
              <Button
                variant="primary"
                type="submit"
                onClick={() => {
                  setLoading(true);
                  setTimeout(() => {
                    setLoading(false);
                  }, 1000);
                }}
              >
                Calculate
              </Button>
            </Col>
          </Form>
        </Row>

        <Row>
          <Col>
            <Amortization loan={loan} loading={loading} />
          </Col>
        </Row>
      </Container>
    </>
  );
}

const container = {
  justifyContent: "center",
  alignItems: "center",
  marginTop: "20px",
  marginBottom: "20px",
  marginLeft: "20px",
  marginRight: "20px",
  padding: "20px",
  borderRadius: "10px",
  border: "1px solid #ccc",
  backgroundColor: "#f5f5f5",
  fontSize: "20px",
  fontWeight: "bold",
  fontFamily: "Arial, Helvetica, sans-serif",
  fontStyle: "italic",
  textAlign: "center",
  textDecoration: "underline",
  textTransform: "uppercase",
  textShadow: "1px 1px #ccc",
};

const form = {};

export default Loans;
