import LanguageServer:LanguageServerInstance
import Pkg
import SymbolServer

envpath = dirname(Pkg.Types.Context().env.project_file)

depotpath = joinpath(ENV["HOME"], ".julia")

server = LanguageServerInstance(stdin, stdout, false, envpath, depotpath, Dict())
server.runlinter = true
run(server)
