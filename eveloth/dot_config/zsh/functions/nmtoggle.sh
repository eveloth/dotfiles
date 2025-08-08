#!/bin/bash

nmt(){
  (nmcli -t c s --active | grep -q $1 && nmcli c d $1) || nmcli c u $1
}
