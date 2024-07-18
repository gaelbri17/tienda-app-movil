import React, { useEffect, useState } from 'react';
import { View, Text, StyleSheet, ActivityIndicator } from 'react-native';

export default function Home({ route }) {
  const [userName, setUserName] = useState('');
  const [loading, setLoading] = useState(true);
  
  // Suponiendo que tienes el ID del cliente en las rutas
  const userId = route.params?.userId;

  useEffect(() => {
    // Función para obtener el nombre del usuario desde la API
    const fetchUserName = async () => {
      try {
        const response = await fetch('http://localhost/tienda-app-movil/FrostyThreads-web/api/services/public/cliente.php?action=getUserById', {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json',
          },
          body: JSON.stringify({ idCliente: userId }),
        });
        const result = await response.json();
        if (result.status === 1) {
          setUserName(result.username);
        } else {
          setUserName('Usuario');
        }
      } catch (error) {
        console.error(error);
        setUserName('Usuario');
      } finally {
        setLoading(false);
      }
    };

    fetchUserName();
  }, [userId]);

  if (loading) {
    return (
      <View style={styles.container}>
        <ActivityIndicator size="large" color="#FFC0CB" />
      </View>
    );
  }

  return (
    <View style={styles.container}>
      <Text style={styles.title}>¡Bienvenido de nuevo, {userName}!</Text>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#f9f9f9',
    padding: 20,
  },
  title: {
    fontSize: 32,
    fontWeight: 'bold',
    color: '#FFC0CB',
    marginBottom: 20,
  },
});
