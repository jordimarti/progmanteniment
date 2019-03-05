class PagamentsController < ApplicationController
	def cambra_projects
    @mesos = [['Gener', '01'], ['Febrer', '02'], ['Març', '03'], ['Abril', '04'], ['Maig', '05'], ['Juny', '06'], ['Juliol', '07'], ['Agost', '08'], ['Setembre', '09'], ['Octubre', '10'], ['Novembre', '11'], ['Desembre', '12']]
    @edificis = []
    for i in 0..11
      any = params[:any]
      mes_nom = @mesos[i][0]
      mes_nombre = @mesos[i][1]
      @edificis.push consulta_edificis_cambra(any, mes_nombre)
    end
  end

  def consulta_edificis_cambra(any, mes)
    edificis = Edifici.where(creador: 'cambra')
    edificis_any = edificis.where('extract(year from created_at) = ?', any)
    edificis_mes = edificis_any.where('extract(month from created_at) = ?', mes)
    return edificis_mes
  end
end