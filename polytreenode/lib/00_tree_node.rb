class PolyTreeNode
    attr_reader :parent, :children, :value
    attr_writer :children
    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def parent=(daddy)
        if daddy && @parent
            @parent.children.delete(self)
        elsif daddy.nil? && @parent
            @parent.children.delete(self)
        elsif !daddy.children.include?(self)
            daddy.children << self
        end


        @parent = daddy
    end
end