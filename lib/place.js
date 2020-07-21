const statuses = {
  yes: 'success',
  limited: 'success',
  unknown: 'warning',
  no: 'error'
};

export function colorForStatus(status)  {
  return statuses[status];
}

export function rawColorForStatus(status, theme) {
  const statuses = {
    yes: theme.success,
    limited: theme.success,
    unknown: '#9E9E9E',
    no: '#212121'
  };
  return statuses[status];
}
