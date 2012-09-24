explanation = "
<table class='table table-striped'>
  <tr>
    <th>Proposta</th>
    <th>Opnião do Meu Candidato</th>
    <th>Minha Opnião</th>
  </tr>
  {{ #questions }}
  <tr>
    <td>{{ title }}</td>
    <td><img alt='{{ candidate_opnion }}' src='/assets/{{ candidate_opnion }}.png' /></td>
    <td><img alt='{{ my_vote }}' src ='/assets/{{ my_vote }}.png' /></td>
  </tr>
  {{ /questions }}
</table>
"
MyWindow().explanation = explanation