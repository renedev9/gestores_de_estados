
import 'package:estados_app/config/config.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'future_providers.g.dart';

@Riverpod(keepAlive: true)
Future<String> pokemonName(PokemonNameRef ref) async{
 final pokemonId= ref.watch(pokemonIdProvider); //*pokemonIdProvider por defecto es un AutoDisposeProvider, es necesario declarar el keepAlive en true, esto se debe a que puede estar autodestruido el provider cuando se llama aqui, asi que mejor mantener vivo el provider

  final pokemonName= await PokemonInformation.getPokemonName(pokemonId);
  return pokemonName;
}

@Riverpod(keepAlive: true)
class PokemonId extends _$PokemonId {
  @override
  int build() {
    return 1;
  }

  void nextPokemon(){
    state= state++;
  }

  void prevPokemon(){
    if(state>1){

    state= state--;
    }
  }
}


//! Anteriormente llamados family
@Riverpod(keepAlive: true)
Future<String> pokemon(PokemonRef ref,int pokemonId) async{
  final pokemonName= await PokemonInformation.getPokemonName(pokemonId);
   return pokemonName;
}
