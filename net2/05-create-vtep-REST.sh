#/bin/bash
curl -u admin:admin -H "Content-Type: application/json" -X PUT -d'

{

  "network-topology:termination-point": [

      {

        "ovsdb:options": [

          {

                  "ovsdb:option": "remote_ip",

                  "ovsdb:value" : "192.168.155.2"

          },

          {

              "ovsdb:option":"local_ip",

              "ovsdb:value":"192.168.150.1"

          },

          {

              "ovsdb:option":"key",

              "ovsdb:value":"flow"

          }

        ],

        "ovsdb:ofport": "10",

        "ovsdb:name": "vtep2",

        "ovsdb:interface-type": "ovsdb:interface-type-vxlan",

        "tp-id": "vtep2"

    }

    ]

}' http://192.168.56.20:8181/restconf/config/network-topology:network-topology/topology/ovsdb:1/node/ovsdb:%2F%2Fuuid%2F3f3e3b0c-df1a-4d8d-9f73-283402679ec0%2Fbridge%2Fbr-tun/termination-point/vtep2/


# http://192.168.56.15:8181/restconf/config/network-topology:network-topology/topology/ovsdb:1/node/ovsdb:%2F%2Fuuid%2Fd2159fb9-12b4-4802-ad00-262a39751528%2Fbridge%2Fbr-tun/termination-point/vtep1/
