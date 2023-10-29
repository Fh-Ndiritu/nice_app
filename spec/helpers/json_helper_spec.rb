def parse(response)
    JSON.parse(response.body, object_class: OpenStruct)
end