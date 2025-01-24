using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace PicoYPlacaApp
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private void buttonVerificar_Click(object sender, EventArgs e)
        {
            // Obtener valores ingresados
            string placa = textBoxPlaca.Text;
            DateTime fecha = dateTimePickerFecha.Value;
            string horaTexto = textBoxHora.Text;

            // Validación de datos de entrada
            if (string.IsNullOrWhiteSpace(placa) || string.IsNullOrWhiteSpace(horaTexto))
            {
                MessageBox.Show("Por favor, ingrese todos los datos.");
                return;
            }

            // Convertir la hora ingresada
            TimeSpan hora;
            if (!TimeSpan.TryParse(horaTexto, out hora))
            {
                MessageBox.Show("La hora ingresada no es válida. Usa el formato HH:mm.");
                return;
            }

            // Obtener el último dígito numérico de la placa
            char ultimoDigito = placa.Reverse().FirstOrDefault(c => char.IsDigit(c));
            if (ultimoDigito == '\0')
            {
                MessageBox.Show("La placa ingresada no tiene un dígito numérico válido.");
                return;
            }

            int digito = int.Parse(ultimoDigito.ToString());

            // Determinar el día de la semana (0 = Domingo, 1 = Lunes, ..., 6 = Sábado)
            DayOfWeek dia = fecha.DayOfWeek;

            // Restricción por día y dígito
            bool tieneRestriccion = false;

            switch (dia)
            {
                case DayOfWeek.Monday:
                    tieneRestriccion = (digito == 1 || digito == 2);
                    break;
                case DayOfWeek.Tuesday:
                    tieneRestriccion = (digito == 3 || digito == 4);
                    break;
                case DayOfWeek.Wednesday:
                    tieneRestriccion = (digito == 5 || digito == 6);
                    break;
                case DayOfWeek.Thursday:
                    tieneRestriccion = (digito == 7 || digito == 8);
                    break;
                case DayOfWeek.Friday:
                    tieneRestriccion = (digito == 9 || digito == 0);
                    break;
                default:
                    tieneRestriccion = false;
                    break;
            }

            bool enHorarioRestringido = (hora >= new TimeSpan(6, 0, 0) && hora <= new TimeSpan(9, 30, 0)) ||
                                        (hora >= new TimeSpan(16, 0, 0) && hora <= new TimeSpan(20, 0, 0));

            string resultado = (tieneRestriccion && enHorarioRestringido) ? "No puede circular en este horario." : "Puede circular.";

            labelResultado.Text = resultado;

            // Guardar los datos en la base de datos
            try
            {
                string connectionString = ConfigurationManager.ConnectionStrings["PicoYPlacaDB"].ConnectionString;
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    string query = "INSERT INTO Consultas (Placa, Fecha, Hora, Resultado) VALUES (@Placa, @Fecha, @Hora, @Resultado)";
                    SqlCommand command = new SqlCommand(query, connection);
                    command.Parameters.AddWithValue("@Placa", placa);
                    command.Parameters.AddWithValue("@Fecha", fecha);
                    command.Parameters.AddWithValue("@Hora", hora);
                    command.Parameters.AddWithValue("@Resultado", resultado);

                    connection.Open();
                    command.ExecuteNonQuery();
                    MessageBox.Show("Datos guardados correctamente en la base de datos.");
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error al guardar en la base de datos: " + ex.Message);
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            textBoxPlaca.Clear();
            textBoxHora.Clear();
            dateTimePickerFecha.Value = DateTime.Now;
            labelResultado.Text = "";
        }
    }
}
