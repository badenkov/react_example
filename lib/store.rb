module Store
  def self.current
    @store ||= Moneta.build do
      use :Transformer, value: :marshal
      adapter :Redis
    end
  end
end
