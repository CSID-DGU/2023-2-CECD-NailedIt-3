import { LineChart, Line, CartesianGrid, XAxis, YAxis } from 'recharts';

interface ChartData {
    name: string;
    uv: number;
    pv: number;
    amt: number;
}

const data: ChartData[] = [
    {name: '00:00', uv: 400, pv: 2300, amt: 2400},
    {name: '06:00', uv: 200, pv: 2100, amt: 2400},
    {name: '12:00', uv: 300, pv: 2000, amt: 2400},
    {name: '18:00', uv: 700, pv: 1900, amt: 2400},

];

const ChartTest: React.FC = () => (
    <LineChart width={800} height={400} data={data}>
        <Line type="monotone" dataKey="uv" stroke="#8884d8" />
        <CartesianGrid stroke="#ccc" />
        <XAxis dataKey="name" />
        <YAxis />
    </LineChart>
);

export default ChartTest;
