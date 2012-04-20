$:.unshift('/home/ericp/svn/apps/komodo/mozilla/d/mz700k712/mozilla/kobj712/dist/komodo-bits/support/dbgp/rubylib/1.9.3/x86')
require 'ruby_debug.so'

Debugger.start_
class C
  attr_accessor :b
  def m1(a)
    sc = Debugger.current_context
    stack_size = sc.stack_size
    $stderr.puts("stack_size: #{stack_size}")
    (0...sc.stack_size).each do |pos|
      # Works for frames 0 (C.m1) and 1 (C.m), dies with the outer frame
      frame_id = sc.frame_id(pos)
      $stderr.print("frame_id(#{pos}): ")
      $stderr.print(" (id: #{frame_id.object_id}) ")
      repn = frame_id.to_s
      $stderr.puts(repn)
    end
    a + 1
  end
  
  def m
    @b = m1(2)
  end
end

puts C.new.m
