import fs from 'fs'

export default (data, filename) => {
    fs.writeFile(filename, JSON.stringify(data), {
      encoding: 'utf8'
    }, (err) => {
      if (err) throw err
    })
  }