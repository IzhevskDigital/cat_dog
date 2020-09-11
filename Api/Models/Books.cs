using MongoDB.Bson;
using MongoDB.Bson.Serialization.Attributes;

namespace BooksApi.Models
{
    public class Book
    {
        [BsonId]
        [BsonRepresentation(BsonType.ObjectId)]
        public string Id { get; set; }

        [BsonElement("Name")]
        public string PetName { get; set; }

        public decimal Age { get; set; }

        public string Gender { get; set; }

        public string Pet { get; set; }
    }
}