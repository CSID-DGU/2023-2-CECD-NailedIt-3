import asyncio
import logging
from util import save_to_file, check_input
from context import Context

async def main():
    context = Context()
    
    await asyncio.gather(
        save_to_file(context),
        check_input(context)
    )
    
    logging.info("System stopped.")

if __name__ == "__main__":
    asyncio.run(main())
