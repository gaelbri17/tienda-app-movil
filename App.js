import React from 'react';
import { NavigationContainer } from '@react-navigation/native';
import import Navigator from './src/navigation/Navigator';{ createNativeStackNavigator } from '@react-navigation/native-stack';

import Sesion from './src/screens/Sesion';
import Registro from './src/screens/Registro';


const Stack = createNativeStackNavigator();


export default function App() {
  return (
    <NavigationContainer>
      <Stack.Navigator initialRouteName="Sesion"
       screenOptions={{ headerShown: false }}>
        <Stack.Screen name="Sesion" component={Sesion} />
        <Stack.Screen name="Registro" component={Registro} />
        <Stack.Screen name="Navigator" component={Navigator} />
      </Stack.Navigator>
    </NavigationContainer>
  );
}
 
