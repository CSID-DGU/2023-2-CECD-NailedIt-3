import { LineChart, Line } from 'recharts';

interface ChartData {
    name: string;
    uv: number;
    pv: number;
    amt: number;
}

const data: ChartData[] = [
    {name: 'Page A', uv: 400, pv: 2300, amt: 2400},
    {name: 'Page A', uv: 200, pv: 2100, amt: 2400},
    {name: 'Page A', uv: 300, pv: 2000, amt: 2400},
    {name: 'Page A', uv: 700, pv: 1900, amt: 2400},

];

const ChartTest: React.FC = () => (
    <LineChart width={400} height={400} data={data}>
        <Line type="monotone" dataKey="uv" stroke="#8884d8" />
    </LineChart>
);

export default ChartTest;
