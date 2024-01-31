import sys
from loguru import logger

KEEP_LOG_FILE = '3 days'

logger.remove()
logger.add(sys.stderr, backtrace=False)
logger.add(
    'logs/{time:YYYY-MM-DD}.error.log',
    rotation='00:00',
    diagnose=True,  # 显示错误原因 (将错误 stack 的每个 obj 的内容显示出来)
    retention=KEEP_LOG_FILE,
    level='ERROR',
    encoding='u8',
)
logger.error(f'{"=" * 40} error loguru started! {"=" * 40}')
logger.add(
    'logs/{time:YYYY-MM-DD}.log',
    rotation='00:00',
    retention=KEEP_LOG_FILE,
    backtrace=False,
    encoding='u8',
)
logger.success(f'{"=" * 40} loguru started! {"=" * 40}')
error_logger = logger.opt(exception=True)
