{
  "version": "1.2",
  "package": {
    "name": "",
    "version": "",
    "description": "",
    "author": "",
    "image": ""
  },
  "design": {
    "board": "alhambra-ii",
    "graph": {
      "blocks": [
        {
          "id": "47ddd8eb-fa6b-441e-ac49-bc3076ac4a59",
          "type": "basic.output",
          "data": {
            "name": "led",
            "range": "[2:0]",
            "pins": [
              {
                "index": "2",
                "name": "LED0",
                "value": "45"
              },
              {
                "index": "1",
                "name": "LED1",
                "value": "44"
              },
              {
                "index": "0",
                "name": "LED2",
                "value": "43"
              }
            ],
            "virtual": false
          },
          "position": {
            "x": 1152,
            "y": 120
          }
        },
        {
          "id": "00963bf8-e6c3-4448-bc2d-fbd6d2c94474",
          "type": "basic.input",
          "data": {
            "name": "sw1",
            "pins": [
              {
                "index": "0",
                "name": "SW1",
                "value": "34"
              }
            ],
            "virtual": false,
            "clock": false
          },
          "position": {
            "x": -16,
            "y": 152
          }
        },
        {
          "id": "e36b126b-df22-4342-8abc-7938598a31cd",
          "type": "basic.output",
          "data": {
            "name": "led",
            "range": "[2:0]",
            "pins": [
              {
                "index": "2",
                "name": "LED5",
                "value": "39"
              },
              {
                "index": "1",
                "name": "LED6",
                "value": "38"
              },
              {
                "index": "0",
                "name": "LED7",
                "value": "37"
              }
            ],
            "virtual": false
          },
          "position": {
            "x": 1144,
            "y": 416
          }
        },
        {
          "id": "a3cbf2f7-ee8a-4a58-9f5e-2db4983c8411",
          "type": "basic.constant",
          "data": {
            "name": "Periodo",
            "value": "4",
            "local": false
          },
          "position": {
            "x": -32,
            "y": 328
          }
        },
        {
          "id": "f26c4ea0-e39e-4b75-b1f5-3908658cf49d",
          "type": "5b3e6904f8f6874e0279794889dab02e12abea04",
          "position": {
            "x": -32,
            "y": 448
          },
          "size": {
            "width": 96,
            "height": 64
          }
        },
        {
          "id": "b428c685-7d68-495d-bf05-2a67f5af271d",
          "type": "basic.code",
          "data": {
            "code": "//module posNeg(input reset, input clk, output [2:0] e, output [2:0] f);\n\nreg [2:0] a=1;       //inicializo a cero, por defecto los sintetizadores inician a cero.\nreg [2:0] b=1;       //valor por defecto \n\n\n// originalmente a = 7  b=5\n\n//always @(posedge reset)  // no puedo modificar las mismas variables en otro always\n//  begin                  // funciona el reset pero no los contadores\n//    a<=0;                // a<=2; b<=2; no construye --> multiples salidas distintas a un mismo punto\n//    b<=0;\n//  end\n  \nalways @(posedge clk, posedge reset)    // reacciona con el flanco positivo\n if(reset) a <= 0;\n   else    a<=a+1;\n\nalways @(negedge clk, posedge reset)    // reacciona con el flanco negativo (2 sg más tarde para un Periodo de 4 sg)\n  if(reset) b <= 0;\n    else b<=b+1;\n\nassign e = a;      //Asignación\nassign f = b;\n\n//endmodule",
            "params": [],
            "ports": {
              "in": [
                {
                  "name": "reset"
                },
                {
                  "name": "clk"
                }
              ],
              "out": [
                {
                  "name": "e",
                  "range": "[2:0]",
                  "size": 3
                },
                {
                  "name": "f",
                  "range": "[2:0]",
                  "size": 3
                }
              ]
            }
          },
          "position": {
            "x": 168,
            "y": 32
          },
          "size": {
            "width": 904,
            "height": 592
          }
        }
      ],
      "wires": [
        {
          "source": {
            "block": "b428c685-7d68-495d-bf05-2a67f5af271d",
            "port": "e"
          },
          "target": {
            "block": "47ddd8eb-fa6b-441e-ac49-bc3076ac4a59",
            "port": "in"
          },
          "size": 3
        },
        {
          "source": {
            "block": "b428c685-7d68-495d-bf05-2a67f5af271d",
            "port": "f"
          },
          "target": {
            "block": "e36b126b-df22-4342-8abc-7938598a31cd",
            "port": "in"
          },
          "size": 3
        },
        {
          "source": {
            "block": "f26c4ea0-e39e-4b75-b1f5-3908658cf49d",
            "port": "70887b0b-826c-4150-a873-605b77da8272"
          },
          "target": {
            "block": "b428c685-7d68-495d-bf05-2a67f5af271d",
            "port": "clk"
          }
        },
        {
          "source": {
            "block": "a3cbf2f7-ee8a-4a58-9f5e-2db4983c8411",
            "port": "constant-out"
          },
          "target": {
            "block": "f26c4ea0-e39e-4b75-b1f5-3908658cf49d",
            "port": "319cdca8-e777-4c8b-88ca-f885ba96ad06"
          }
        },
        {
          "source": {
            "block": "00963bf8-e6c3-4448-bc2d-fbd6d2c94474",
            "port": "out"
          },
          "target": {
            "block": "b428c685-7d68-495d-bf05-2a67f5af271d",
            "port": "reset"
          }
        }
      ]
    }
  },
  "dependencies": {
    "5b3e6904f8f6874e0279794889dab02e12abea04": {
      "package": {
        "name": "Corazon_Seg",
        "version": "0.1",
        "description": "Bombear 1 bit con el periodo especificado en el parámetro. Por defecto el periodo es de 1 segundos",
        "author": "Juan Gonzalez-Gomez (obijuan)",
        "image": "%3Csvg%20xmlns=%22http://www.w3.org/2000/svg%22%20width=%22188.169%22%20height=%22156.392%22%20viewBox=%220%200%20176.40913%20146.61832%22%3E%3Cpath%20d=%22M78.495%20143.399c-2.574-4.43-6.565-8.766-14.127-15.35-4.096-3.566-6.588-5.546-20.775-16.506-11.12-8.593-16.668-13.36-23.098-19.847C14.07%2085.208%2010.293%2080.04%207.052%2073.303%204.984%2069%203.562%2064.854%202.676%2060.547c-1.123-5.472-1.275-7.324-1.27-15.382.008-10.573.357-12.332%203.828-19.385%202.58-5.239%204.54-7.997%208.62-12.141%203.963-4.022%206.536-5.85%2012.1-8.6%206.18-3.057%2010.65-3.859%2019.86-3.562%207.157.232%209.776.943%2015.45%204.208%208.929%205.138%2015.858%2013.387%2017.776%2021.162.313%201.27.636%202.312.719%202.312.082%200%20.805-1.487%201.606-3.305%202.727-6.179%205.26-9.95%209.284-13.828%2012.32-11.88%2031.744-14.027%2047.45-5.25%206.414%203.584%2011.633%208.802%2015.676%2015.675%203.184%205.41%204.812%2012.595%205.09%2022.464.402%2014.298-2.214%2024.207-9.174%2034.766-2.763%204.191-4.806%206.73-8.638%2010.73-6.182%206.458-11.758%2011.205-24.92%2021.216-8.307%206.317-13.23%2010.378-20.355%2016.8-5.71%205.143-14.558%2014.1-15.41%2015.596-.372.655-.71%201.19-.749%201.19-.039%200-.544-.816-1.124-1.814z%22%20fill=%22red%22%20stroke=%22#000%22%20stroke-width=%222.813%22/%3E%3Ctext%20y=%22136.183%22%20x=%22114.12%22%20style=%22line-height:125%25%22%20font-weight=%22400%22%20font-size=%2253.914%22%20letter-spacing=%220%22%20word-spacing=%220%22%20transform=%22scale(.99853%201.00147)%22%20font-family=%22sans-serif%22%20fill=%22#00f%22%3E%3Ctspan%20style=%22-inkscape-font-specification:'sans-serif%20Bold'%22%20y=%22136.183%22%20x=%22114.12%22%20font-weight=%22700%22%20font-size=%2230.808%22%3ESeg%3C/tspan%3E%3C/text%3E%3C/svg%3E"
      },
      "design": {
        "graph": {
          "blocks": [
            {
              "id": "70887b0b-826c-4150-a873-605b77da8272",
              "type": "basic.output",
              "data": {
                "name": ""
              },
              "position": {
                "x": 560,
                "y": 128
              }
            },
            {
              "id": "4656865c-bcf1-4668-8e13-9221e32222d3",
              "type": "basic.input",
              "data": {
                "name": "",
                "clock": true
              },
              "position": {
                "x": -296,
                "y": 128
              }
            },
            {
              "id": "319cdca8-e777-4c8b-88ca-f885ba96ad06",
              "type": "basic.constant",
              "data": {
                "name": "",
                "value": "1",
                "local": false
              },
              "position": {
                "x": 112,
                "y": -224
              }
            },
            {
              "id": "7e864797-b165-408f-a9ce-2e71dc63f8b8",
              "type": "basic.code",
              "data": {
                "code": "\n//parameter HZ=1;\n\n//-- Constante para dividir y obtener una frecuencia de 1Hz\nlocalparam M = 12000000*SEG;\n\n//-- Calcular el numero de bits para almacenar M\nlocalparam N = $clog2(M);\n\n//-- Registro del divisor\nreg [N-1:0] divcounter;\n\n//-- Temporal clock\nreg clk_t = 0;\n\n//-- Se usa un contador modulo M/2 para luego\n//-- pasarlo por un biestable T y dividir la frecuencia\n//-- entre 2, para que el ciclo de trabajo sea del 50%\nalways @(posedge clk)\n    if (divcounter == M/2) begin\n      clk_t <= 1;\n      divcounter = 0;\n    end \n    else begin\n      divcounter <=  divcounter + 1;\n      clk_t = 0;\n    end \n  \nreg clk_o = 0;  \n    \n//-- Biestable T para obtener ciclo de trabajo del 50%\nalways @(posedge clk)\n  if (clk_t)\n    clk_o <= ~clk_o;\n",
                "params": [
                  {
                    "name": "SEG"
                  }
                ],
                "ports": {
                  "in": [
                    {
                      "name": "clk"
                    }
                  ],
                  "out": [
                    {
                      "name": "clk_o"
                    }
                  ]
                }
              },
              "position": {
                "x": -104,
                "y": -104
              },
              "size": {
                "width": 528,
                "height": 528
              }
            }
          ],
          "wires": [
            {
              "source": {
                "block": "7e864797-b165-408f-a9ce-2e71dc63f8b8",
                "port": "clk_o"
              },
              "target": {
                "block": "70887b0b-826c-4150-a873-605b77da8272",
                "port": "in"
              }
            },
            {
              "source": {
                "block": "4656865c-bcf1-4668-8e13-9221e32222d3",
                "port": "out"
              },
              "target": {
                "block": "7e864797-b165-408f-a9ce-2e71dc63f8b8",
                "port": "clk"
              },
              "vertices": []
            },
            {
              "source": {
                "block": "319cdca8-e777-4c8b-88ca-f885ba96ad06",
                "port": "constant-out"
              },
              "target": {
                "block": "7e864797-b165-408f-a9ce-2e71dc63f8b8",
                "port": "SEG"
              }
            }
          ]
        }
      }
    }
  }
}