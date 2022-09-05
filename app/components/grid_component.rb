class GridComponent < ViewComponent::Base
  def initialize(params)
    super
    @column_gap = params[:column_gap]
    @row_gap = params[:row_gap]
    @columns = params[:columns]
    @rows = params[:rows]
  end

  def columns_css
    return unless @columns

    'auto ' * @columns.to_i
  end

  def rows_css
    return unless @row

    'auto ' * @rows.to_i
  end
end
