                                                  ArveVM, 6.oct.2022
# PriceAnalyzer-integration
[Official Erlend-documentation](https://github.com/erlendsellie/priceanalyzer)




## How I use this integration:  
- The integrations creates an entity for "save/boost/normal" based upon "is price going up or down, so should heaters-temp be changed
  - but is also adding spot-prices from Nordpool  (north eurpoa spot market for electrical power)
    - so I have one sensor where I'm Adding additional cost(s) (se code-example below), including local day/night tarriffs
    - and one for Nordpool-spot without any additional cost
- Use it as input to control "charging" hotwater, heaters and electric car when prices are low(est) 
- Use it in LaundryHeater, with blueprint to adjust thermostat-temp according to ricing/falling prices
- It gives a multitude of data in the attributes of the sensor, check out Erlend's awsome github :)


## Install - see instruction on Priceanalyzer-github
### Code sample to add additional cost (add when creating entity):  

Using some variables in the start of the code,, to easily adopt new values when adding a new sensor/entity:

The Total cost of electricity is divided in Energy-cost, and Transportation cost
- Energy cost is for me:
  - Nordpool spot
  - Power company markup upon Nordpool spot
- Transportation cost:
  - Enova-fee, pr kWh (energy-efficiensy/savings-fund)
  - Transport_fixed, pr kWh (Forbruksavgift)  
  - Transport_night, pr kWh (Energiledd Natt)
  - Transport_day, pr kWh (Energiledd dag)
- Then a capacity-fee based upon how much you have spent on max three-day-average-max  (will not be part of this pricing,,, will have to be set up in different solution)
Then of-course there will be added the usual value added tax upon them all, but for that i use the "include VAT" in Priceanalyzer-setup

(this table is not updated with prices for 2023,, should be considered an example and explenation of how things are connected)
| Variable           | My value          | Description/purpose |
| ----------         | ----------------- | ------------------- |
| spot               | hourly spot       | PriceAnalyzer get the Nordpool hourly spot-price
| spot_markup        | 0,029             | My supplier adds 2,9 cents (øre) on top of the Nordpool hourly spot-price
| ------------------ |-----------------  | -----------
| enova_fee          | 0.0125            | All customers contribute to fund for energy-efficiency (www.enova.no) 
| state_fee          | 0.1926            | Add another 19,26 cents (øre) to government for 'statleg elavgift/forbruksavgift'
| transport_night    | 0.1250            | In addition to 'base-transport-cost' we add a day- or night-fee
| transport_day      | 0.2000            | In addition to 'base-transport-cost' we add a day- or night-fee
| ------------------ |-----------------  | -----------
| hour_start_night   | 22                | Night-tariff start at 22:00 (and last until 05:59)
| hour_start_day     | 6                 | Day-tariff start at 06:00 (until 21:59)

To use this,, copy the code below - and update the spot markup to correct data for your agreement with your power supplier (amounts in KR, even if you use Øre), and add to this section when creating new sensor/entity/integration: 
<img width="203" alt="image" src="https://user-images.githubusercontent.com/96014323/194400572-639798f1-80e4-415c-970c-ec1284a628a0.png">


Kode for 2022/2023:
```ruby

{% set hour = now().hour %}
{% set month = now().month %}
{% set year = now().year %}

{% set hour_start_night = 22 %}
{% set hour_start_day   = 6 %}

{% set spot_markup      = 0.029%}
{% set enova_fee        = 0.0125 %}

{% if year == 2022 %}
    {% set state_fee        = 0.1926 %}
    {% set transport_night  = 0.1250 %}
    {% set transport_day    = 0.2000 %}
{% else %}
      {% set transport_night  = 0.1500 %}
      {% set transport_day    = 0.2250 %}
      {% if month <= 3  %}
        {% set state_fee      = 0.1145 %}
      {%else%}
        {% set state_fee      = 0.1980 %}
    {% endif %}
{% endif %}

{% set price =         spot_markup %}
{% set price = price + enova_fee %}
{% set price = price + state_fee %}

{% if hour >= hour_start_night or hour < hour_start_day %}
  {% set price = price + transport_night %}
{% else%}
  {% set price = price + transport_day %}
{% endif %}
{{ price | round(4)}}

```
source: https://www.morenett.no/informasjon/nettleie-privat
test-tip: 
- copy&paste code in Dev.tools/template
- change top three lines to accomodate different dates/times by removing "now().hour" and put 23,, and you will get data for the last hour (same goes for month/year to test new tarrifs



Gammel kode for 2022
```ruby

{% set spot_markup      = 0.029 %}
{% set enova_fee        = 0.0125 %}
{% set state_fee        = 0.1926 %}
{% set transport_night  = 0.1250 %}
{% set transport_day    = 0.2000 %}
{% set hour_start_night = 22 %}
{% set hour_start_day   = 6 %}

{% set price = spot_markup %}
{% set price = price + enova_fee %}
{% set price = price + state_fee %}

{%set hour = now().hour%}
{% if hour >= hour_start_night or hour < hour_start_day %}
  {% set price = price + transport_night %}
{% else%}
  {% set price = price + transport_day %}
{% endif %}
{{ price | round(4)}}

```

## toDo / plans ahead:
- warnings??
- for each solution, pick price-profile (lowest 5, lowest-10)   - and add chart showing future states/savings/boosts
- Append step-wise mothly cost-tarrif to solution for average highes three hours,,, to add the actual monthly capacity-fee
